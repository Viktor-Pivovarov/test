import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_supporting/jojo_supporting.dart';

class SupportingRouter extends AppRouter {
  SupportingRouter(super.router);

  void goToSupporting() {
    pushNamed(SupportingRoutePath.supporting);
  }
}
