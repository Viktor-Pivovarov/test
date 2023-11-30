import 'package:auto_route/auto_route.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';

List<AutoRoute> authRoutes = [
  AutoRoute(
    page: AuthRoute.page,
    path: RoutePath.auth,
  ),
  AutoRoute(
    page: GreetingsRoute.page,
    path: AuthRoutePath.greetings,
  ),
  AutoRoute(
    page: ApplicationLgbtRoute.page,
    path: AuthRoutePath.lgbt,
  ),
  AutoRoute(
    page: OnboardingSelectSexRoute.page,
    path: AuthRoutePath.sex,
  ),
  AutoRoute(
    page: OnboardingAstrologicalRoute.page,
    path: AuthRoutePath.astrological,
  ),
  AutoRoute(
    page: OnboardingVerificationRoute.page,
    path: AuthRoutePath.verification,
  ),
  AutoRoute(
    page: OnboardingVerificationNotReadyRoute.page,
    path: AuthRoutePath.verificationNotReady,
  ),
  AutoRoute(
    page: OnboardingNotificationRoute.page,
    path: AuthRoutePath.notification,
  ),
  AutoRoute(
    page: OnboardingPaymentRoute.page,
    path: AuthRoutePath.payment,
  ),
  AutoRoute(
    page: OnboardingPaymentNotReadyRoute.page,
    path: AuthRoutePath.paymentNotReady,
  ),
  AutoRoute(
    page: OnboardingGeoLocationRoute.page,
    path: AuthRoutePath.geoLocation,
  ),
  AutoRoute(
    page: OnboardingCheckNotificationRoute.page,
    path: AuthRoutePath.checkNotifications,
  ),
];
