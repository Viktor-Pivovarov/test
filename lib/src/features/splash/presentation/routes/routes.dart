import 'package:auto_route/auto_route.dart';
import 'package:jojo/src/core/_core.dart';

List<AutoRoute> splashRoutes = [
  CustomRoute(
    transitionsBuilder: TransitionsBuilders.fadeIn,
    path: RoutePath.initial,
    page: SplashRoute.page,
    initial: true,
  ),
];
