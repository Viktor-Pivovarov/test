import 'package:jojo/src/core/navigation/_navigation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class SignUpRouter extends AppRouter {
  SignUpRouter(super.router);

  void goToMain() {
    replaceNamed('/main');
  }

  void goToSignUp() {
    pushNamed(RoutePath.authSignUp);
  }

  void goToGeoLocation() {
    pushNamed(RoutePath.authSignUpGeoLocation);
  }

  void goToSteps() {
    replaceNamed(RoutePath.authSignUpSteps);
  }

  void goToNotification() {
    pushNamed(RoutePath.authSignUpNotification);
  }
}
