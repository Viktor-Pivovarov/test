import 'package:jojo_sdk/jojo_sdk.dart';

class VerifyAccountStatusUseCase
    extends UseCase<Either<Failure, void>, NoParams> {
  VerifyAccountStatusUseCase({
    required AuthManager<AuthenticatedUser> authManager,
  }) : _authManager = authManager;

  final AuthManager<AuthenticatedUser> _authManager;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return _authManager.verify();
  }
}
