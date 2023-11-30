import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class SubscribeDatingInfoUseCase
    extends UseCase<Stream<DatingInfoModel?>, NoParams> {
  SubscribeDatingInfoUseCase(
    this._datingInfoRepository,
    this._authManager,
  );

  final AuthManager<AuthenticatedUser> _authManager;

  final DatingInfoRepository _datingInfoRepository;

  @override
  Future<Stream<DatingInfoModel?>> call(
    NoParams params,
  ) async {
    return _datingInfoRepository.subscribe(_authManager.user.account.email);
  }
}
