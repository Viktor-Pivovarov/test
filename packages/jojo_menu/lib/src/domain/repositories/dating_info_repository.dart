import 'package:jojo_menu/src/domain/models/dating_info/dating_info_model.dart';
import 'package:xander9112/xander9112.dart';

abstract class DatingInfoRepository {
  Future<Either<Failure, DatingInfoModel>> getDatingInfo(String login);

  Stream<DatingInfoModel?> subscribe(String login);
}
