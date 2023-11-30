import 'package:get_it/get_it.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_supporting/jojo_supporting.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies(EnvConfig env) async {
  await CoreSL().init(env: env);
  await NavigationInjection().init(env: env);

  //feature
  await AppSettingsInjection().init(env: env);

  await GeoLocationInjection().init(env: env);
  await LanguagesInjection().init(env: env);
  await AuthInjection().init(env: env);
  await SignUpInjection().init(env: env);
  await ProfileInjection().init(env: env);
  await SelectionInjection().init(env: env);

  await LikedInjection().init(env: env);

  await ChatInjection().init(env: env);
  await MenuInjection().init(env: env);
  await SupportingInjection().init(env: env);
}
