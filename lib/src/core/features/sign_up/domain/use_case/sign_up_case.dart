import 'package:jojo_sdk/jojo_sdk.dart';

class SignUpCase implements UseCase<Either<Failure, bool>, SignUpCaseParams> {
  SignUpCase(this._authManager);

  final AuthManager<AuthenticatedUser> _authManager;

  @override
  Future<Either<Failure, bool>> call(SignUpCaseParams params) async {
    final result = await _authManager.signUp(params);

    return result.fold(Left.new, Right.new);
  }
}
