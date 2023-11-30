import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetDatingInfoUseCase
    extends UseCase<Either<Failure, DatingInfoModel>, NoParams> {
  GetDatingInfoUseCase(this._datingInfoRepository, this._authManager);

  final DatingInfoRepository _datingInfoRepository;

  final AuthManager<AuthenticatedUser> _authManager;

  @override
  Future<Either<Failure, DatingInfoModel>> call(NoParams params) {
    return _datingInfoRepository.getDatingInfo(_authManager.user.account.email);
  }
}
