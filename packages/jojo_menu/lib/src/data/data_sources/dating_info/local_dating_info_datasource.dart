import 'package:jojo_menu/src/domain/models/dating_info/dating_info_model.dart';

abstract class LocalDatingInfoDataSource {
  Future<void> init();

  Future<void> clear();

  Stream<DatingInfoModel?> watch(String login);

  Future<DatingInfoModel?> getDatingInfo(String login);

  Future<void> saveDatingInfo(String login, DatingInfoModel datingInfo);
}
