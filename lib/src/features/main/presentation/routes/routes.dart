import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

List<AutoRoute> mainRoutes = [
  CustomRoute(
    transitionsBuilder: TransitionsBuilders.fadeIn,
    path: RoutePath.main,
    page: MainRoute.page,
    guards: [AuthGuard(AuthInjection.sl<AuthManager<AuthenticatedUser>>())],
    children: [
      ...profileRoutes,
      ...likedRoutes,
      ...selectionRoutes,
      ...chatRoutes,
      ...menuRoutes,
    ],
  ),
];
