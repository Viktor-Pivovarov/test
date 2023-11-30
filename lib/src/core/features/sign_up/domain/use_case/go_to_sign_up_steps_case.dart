import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GoToStepsCase implements UseCase<void, NoParams> {
  GoToStepsCase(this._router);

  final SignUpRouter _router;

  @override
  Future<void> call(NoParams onResult) async {
    _router.popUntilRoot();

    await _router.replaceNamed(RoutePath.authSignUpSteps);
  }
}
