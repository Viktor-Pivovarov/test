import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

class UserSettingsRepositoryImpl implements UserSettingsRepository {
  UserSettingsRepositoryImpl(this._remoteUserSettingsDatasource);

  final RemoteUserSettingsDatasource _remoteUserSettingsDatasource;

  @override
  Future<Either<Failure, UserSettingsModel>> getUserSettings() async {
    try {
      final result = await _remoteUserSettingsDatasource.getUserSettings();

      return Right(result.settings);
    } on DioException catch (error) {
      return Left(
        UserSettingsFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(UserSettingsFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setNotificationMutualSympathyOffer() async {
    try {
      await _remoteUserSettingsDatasource.toggleNotificationMutualSympathy();

      return const Right(null);
    } on DioException catch (error) {
      return Left(
        UserSettingsFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(UserSettingsFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setNotificationNewChatMessage() async {
    try {
      await _remoteUserSettingsDatasource.toggleNotificationNewChatMessage();

      return const Right(null);
    } on DioException catch (error) {
      return Left(
        UserSettingsFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(UserSettingsFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setNotificationNewStackOffer() async {
    try {
      await _remoteUserSettingsDatasource.toggleNotificationNewStackOffer();

      return const Right(null);
    } on DioException catch (error) {
      return Left(
        UserSettingsFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(UserSettingsFailure(code: 1, message: error.toString()));
    }
  }
}
