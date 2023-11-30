import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GoToSignUpCase implements UseCase<void, NoParams> {
  GoToSignUpCase(this._router);

  final SignUpRouter _router;

  @override
  Future<void> call(NoParams onResult) async {
    await _router.pushNamed(RoutePath.authSignUp);
  }
}
