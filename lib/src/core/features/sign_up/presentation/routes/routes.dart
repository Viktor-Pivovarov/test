import 'package:auto_route/auto_route.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_supporting/jojo_supporting.dart';

List<AutoRoute> signUpRoutes = [
  // AutoRoute(
  //   page: SignUpRoute.page,
  //   path: RoutePath.authSignUp,
  // ),
  AutoRoute(
    page: SignUpStepsRoute.page,
    path: RoutePath.authSignUpSteps,
  ),
  AutoRoute(
    page: SupportingRoute.page,
    path: SupportingRoutePath.supporting,
  ),
];
