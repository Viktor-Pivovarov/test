import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class SignOutCase implements UseCase<Either<Failure, void>, NoParams> {
  SignOutCase(this._authManager, this._router);

  final AuthManager<AuthenticatedUser> _authManager;
  final SignUpRouter _router;

  @override
  Future<Either<Failure, void>> call(NoParams noParams) async {
    final result = await _authManager.signOut();

    return result.fold(Left.new, (isSuccess) async {
      await _router.replaceNamed(RoutePath.initial);

      return Right(isSuccess);
    });
  }
}
