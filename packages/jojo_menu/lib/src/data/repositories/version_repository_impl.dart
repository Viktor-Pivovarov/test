import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

class VersionRepositoryImpl implements VersionRepository {
  @override
  Future<Either<MenuFailure, AppInfoModel>> getAppVersion() async {
    try {
      return Right(await AppInfo.getAppInfo());
    } catch (e) {
      return Left(MenuFailure(code: 1, message: 'version getting error'));
    }
  }
}
