import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

abstract class UserSettingsRepository {
  Future<Either<Failure, UserSettingsModel>> getUserSettings();
  Future<Either<Failure, void>> setNotificationMutualSympathyOffer();
  Future<Either<Failure, void>> setNotificationNewChatMessage();
  Future<Either<Failure, void>> setNotificationNewStackOffer();
}
