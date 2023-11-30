// ignore_for_file: one_member_abstracts

import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

abstract class VersionRepository {
  Future<Either<MenuFailure, AppInfoModel>> getAppVersion();
}
