import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class SignOutUseCase implements UseCase<Either<Failure, void>, NoParams> {
  SignOutUseCase(this._authManager, this._router);

  final AuthManager<AuthenticatedUser> _authManager;

  final AuthRouter _router;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await _authManager.signOut();

    return result.fold(Left.new, (isSuccess) async {
      // if (isSuccess) {
      await _router.replaceNamed(RoutePath.initial);
      // }

      return Right(isSuccess);
    });
  }
}
