import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GoToNotificationCase implements UseCase<void, NoParams> {
  GoToNotificationCase(this._router);

  final SignUpRouter _router;

  @override
  Future<void> call(NoParams onResult) async {
    await _router.pushNamed(RoutePath.authSignUp);
  }
}
