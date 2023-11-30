import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jojo/l10n/app_localization_delegate.dart';
import 'package:jojo/l10n/app_localizations.dart';
import 'package:jojo/l10n/device_locale.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/firebase_options.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:neo_image_editor/l10n/generated/neo_image_editor_localizations.dart';
import 'package:path_provider/path_provider.dart';

class App {
  static Future<void> init(EnvConfig env) async {
    await _initCommon();

    await _initStorage(env);

    await _initFirebase(env);

    await _initDependencies(env);

    await _initSettings(env);

    await _initMetrics(env);

    await _initSubscription();

    await _startApp(env);
  }

  static Future<void> _initCommon([
    List<DeviceOrientation>? orientations,
  ]) async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations(
      orientations ??
          <DeviceOrientation>[
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ],
    );
  }

  static Future<void> _initFirebase(EnvConfig env) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform(env),
    );

    if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      // Temporarily toggle this to true
      // if you want to test crash reporting in your app.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      // Handle Crashlytics enabled status when not in Debug,
      // e.g. allow your users to opt-in to crash reporting.
    }

    // Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  static Future<void> _initSettings(EnvConfig env) async {
    await AppSettingsInjection.sl<AppSettingsCubit>().init();
  }

  static Future<void> _initMetrics(EnvConfig env) async {
    await GetIt.I<AppMetrics>().init();
  }

  static Future<void> _initDependencies(EnvConfig env) async {
    return configureDependencies(env);
  }

  static Future<void> _initStorage(EnvConfig env) async {
    Hive
      ..init(
        (kIsWeb
                ? HydratedStorage.webStorageDirectory
                : await getApplicationDocumentsDirectory())
            .path,
      )
      ..registerAdapter(HiveThirdPartyModelAdapter());

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
    );
  }

  static Future<void> _initSubscription() async {
    // final EventBus eventBus = CoreSL.sl<EventBus>();
    final JSocket jSocket = CoreSL.sl<JSocket>();

    jSocket.streamConnect.stream.listen((event) {
      CoreSL.sl<SecureStorageService>().setSocketId(event.client.toString());
    });

    GetIt.I<AuthManager<AuthenticatedUser>>().currentUser.listen((event) {
      // log(jsonEncode(event.toJson()));
      log(event.profile.firstName.toString());

      if (!event.isAuthenticatedUser) {
        jSocket.disconnect();
      } else {
        if (!jSocket.isConnected) {
          jSocket
            ..connect()
            // ..subscribeToChannel(
            //   'private-centrifugo-user-channel.${event.userId}',
            //   (message) {
            //     eventBus.fire(ChatDTO.fromJson(message));
            //   },
            // )
            ..subscribeToChannel(
              'private-centrifugo-user-channel.${event.userId}',
              (message) {
                GetIt.I<AuthManager<AuthenticatedUser>>().user =
                    AuthenticatedUser.fromJson(message);
              },
            );
        }
      }

      // print('User isAuthenticatedUser: ${event.isAuthenticatedUser}');
    });
  }

  static Future<void> _startApp(EnvConfig env) async {
    runApp(JoJoApp(router: GetIt.I()));
  }
}

class JoJoApp extends StatelessWidget {
  const JoJoApp({required this.router, super.key});

  final RootStackRouter router;

  @override
  Widget build(BuildContext context) {
    return SkeletonTheme(
      shimmerGradient: const LinearGradient(
        colors: [
          Color(0xffF9F9F9),
          Color(0xffEDECEC),
          Color(0xffF9F9F9),
        ],
        stops: [
          0.3,
          0.5,
          0.7,
        ],
        begin: Alignment(-1, -0.5),
        end: Alignment(1, 0.5),
      ),
      child: BlocProvider(
        create: (context) => AppSettingsInjection.sl<AppSettingsCubit>(),
        child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
          buildWhen: (previous, current) {
            return previous.selectedLocaleCode != current.selectedLocaleCode;
          },
          builder: (context, state) {
            return MaterialApp.router(
              routerDelegate: AutoRouterDelegate(
                router,
                navigatorObservers: () => [RouterObserver()],
                reevaluateListenable:
                    CoreSL.sl<AuthManager<AuthenticatedUser>>(),
              ),
              themeMode: ThemeMode.light,
              theme: createLightTheme(),
              darkTheme: createDarkTheme(),
              routeInformationParser:
                  router.defaultRouteParser(includePrefixMatches: true),
              localizationsDelegates: const [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                NeoImageEditorLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              locale: const Locale('ru'),
              builder: (context, child) {
                return GetDeviceLocale(
                  child: DialogService.builder(context, child),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class RouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // _logger.d('New route pushed: ${route.settings.name}');

    if (kDebugMode) {
      print('New route pushed: ${route.settings.name}');
    }
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    if (kDebugMode) {
      print('Tab route visited: ${route.name}');
    }
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    if (kDebugMode) {
      // print('Tab route re-visited: ${route.name}');
    }
  }
}
