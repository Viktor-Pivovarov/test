import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo/src/features/main/_main.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo/src/features/splash/splash.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_supporting/jojo_supporting.dart';

part 'app_auto_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
  modules: [SupportingPackageModule, MenuPackageModule],
)
class AppAutoRouter extends _$AppAutoRouter {
  @override
  List<AutoRoute> get routes => [
        ...splashRoutes,
        ...mainRoutes,
        ...authRoutes,
        ...geoLocationRoutes,
        ...languagesRoutes,
        ...signUpRoutes,
      ];
}
