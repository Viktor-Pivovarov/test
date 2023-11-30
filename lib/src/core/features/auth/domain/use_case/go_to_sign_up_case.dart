import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GoToAuthSignUpCase implements UseCase<void, NoParams> {
  GoToAuthSignUpCase(this._router);

  final AuthRouter _router;

  @override
  Future<void> call(NoParams onResult) async {
    await _router.pushNamed(RoutePath.authSignUp);
  }
}
