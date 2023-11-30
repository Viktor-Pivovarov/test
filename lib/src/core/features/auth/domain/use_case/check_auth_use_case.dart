import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class CheckAuthUseCase
    implements UseCase<Either<Failure, bool>, CheckAuthUseCaseParam> {
  CheckAuthUseCase(this._authManager);

  final AuthManager<AuthenticatedUser> _authManager;

  @override
  Future<Either<Failure, bool>> call(CheckAuthUseCaseParam params) async {
    final isAuth = await _authManager.isAuth;
    if (isAuth) {
      if (params.onResult != null) {
        params.onResult?.call(true);
      } else {
        await getIt<RootStackRouter>().replaceNamed(RoutePath.main);
      }
    }
    return Right(isAuth);
  }
}

class CheckAuthUseCaseParam {
  CheckAuthUseCaseParam({
    this.onResult,
  });

  final OnResult? onResult;
}
