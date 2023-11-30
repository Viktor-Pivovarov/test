import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class AuthRouter extends AppRouter {
  AuthRouter(super.router);

  Future<void> goToSignIn(OnResult? onResult) async {
    // await push(SignInRoute(onResult: onResult));
  }

  void goToOnboardingSex() {
    pushNamed(AuthRoutePath.sex);
  }

  void goToMain() {
    replaceNamed(RoutePath.main);
  }

  void goToSex() {
    pushNamed(AuthRoutePath.sex);
  }

  void goToGreetings() {
    pushNamed(AuthRoutePath.greetings);
  }

  void goToLgbt() {
    pushNamed(AuthRoutePath.lgbt);
  }

  void goToAstrological() {
    pushNamed(AuthRoutePath.astrological);
  }

  void goToVerification() {
    pushNamed(AuthRoutePath.verification);
  }

  void goToVerificationNotReady() {
    pushNamed(AuthRoutePath.verificationNotReady);
  }

  void goToNotification() {
    pushNamed(AuthRoutePath.notification);
  }

  void goToPayment() {
    pushNamed(AuthRoutePath.payment);
  }

  void goToPaymentNotReady() {
    pushNamed(AuthRoutePath.paymentNotReady);
  }

  void goToGeoLocation() {
    pushNamed(AuthRoutePath.geoLocation);
  }

  void goToCheckNotifications() {
    pushNamed(AuthRoutePath.checkNotifications);
  }

  void goToSignUp() {
    popUntilRoot();

    replaceNamed(RoutePath.authSignUpSteps);
  }
}
