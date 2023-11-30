// ignore_for_file: cascade_invocations

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo/src/firebase_options.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:x_logger/x_logger.dart';

class CoreSL extends ServiceLocator {
  static final GetIt sl = ServiceLocator.getSL;

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactoryParam(
      (Type type, _) => XLogger(
        type: type,
        // level: Level.debug,
        showStackTrace: true,
        // ignore: avoid_redundant_argument_values
        logToFile: kReleaseMode,
      ),
    );

    final DictsCacheDataSource _dictCacheDataSource =
        HiveDictsCacheDataSource();

    await _dictCacheDataSource.init();

    sl.registerSingleton<DictsCacheDataSource>(_dictCacheDataSource);

    if (useMock) {
      sl.registerFactory<DictDataSource>(MockDictDataSource.new);
    } else {
      sl.registerFactory<DictDataSource>(
        () => RestDictDataSource(sl<DioApiClient>().dio),
      );
    }

    sl.registerSingleton<AppMetrics>(
      AppMetrics(
        appMetricaKey: const String.fromEnvironment(
          'APP_METRICA_KEY',
          defaultValue: '8b32070a-64d6-4069-9880-a7c891c0b569',
        ),
      ),
    );
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl.registerSingleton<DictRepository>(DictRepositoryImpl(sl(), sl()));
  }

  @override
  Future<void> init({EnvConfig? env, bool useMock = false}) async {
    sl.registerSingleton<EventBus>(EventBus());

    sl.registerFactory<FirebaseOptions>(
      () => DefaultFirebaseOptions.currentPlatform(env ?? EnvConfig.dev),
    );

    sl.registerLazySingleton<CancelToken>(CancelToken.new);

    sl.registerLazySingleton(SecureStorageService.new);

    sl.registerSingleton<NotifyService>(NotifyService());

    sl.registerSingleton<DialogService>(DialogService());

    sl.registerSingleton<DioApiClient>(
      DioApiClient(
        Uri.parse(
          const String.fromEnvironment(
            'API_URL',
            defaultValue: 'https://api.jojo-dating.com/api',
          ),
        ),
        // useLogger: false,
      ),
    );

    sl<DioApiClient>().addInterceptor(DeviceHeaderInterceptor());
    sl<DioApiClient>().addInterceptor(AuthInterceptor(sl()));
    sl<DioApiClient>().addInterceptor(LogoutInterceptor());

    sl.registerLazySingleton(
      () => JSocket(dio: sl<DioApiClient>().dio)
        ..createClient(
          const String.fromEnvironment(
            'WS_URL',
            defaultValue: 'ws://api.jojo-dating.com:8000/connection/websocket',
          ),
        ),
    );

    await super.init(env: env, useMock: useMock);
  }
}
