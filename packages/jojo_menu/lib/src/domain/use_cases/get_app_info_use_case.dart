import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetAppInfoUseCase
    extends UseCase<Either<MenuFailure, AppInfoModel>, NoParams> {
  GetAppInfoUseCase(this._versionRepository);

  final VersionRepository _versionRepository;

  @override
  Future<Either<MenuFailure, AppInfoModel>> call(NoParams params) {
    return _versionRepository.getAppVersion();
  }
}
