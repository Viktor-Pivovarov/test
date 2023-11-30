import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class LoginUseCase
    implements UseCase<Either<Failure, AuthResponseModel>, LoginUseCaseParam> {
  LoginUseCase(this._authManager);

  final AuthManager<AuthenticatedUser> _authManager;

  @override
  Future<Either<Failure, AuthResponseModel>> call(
    LoginUseCaseParam params,
  ) async {
    final result = await _authManager.signIn(params.type);

    return result;
  }
}

class LoginUseCaseParam {
  LoginUseCaseParam({
    required this.type,
    this.onResult,
  });

  final SignUpType type;
  final OnResult? onResult;
}
