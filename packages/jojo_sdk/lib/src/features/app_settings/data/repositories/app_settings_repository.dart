import 'package:jojo_sdk/jojo_sdk.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  AppSettingsRepositoryImpl(this._dataSource);

  final AppSettingsDataSource _dataSource;

  @override
  Future<Either<Failure, AppSettingsModel>> getAppSettings() async {
    try {
      final response = await _dataSource.getAppSettings();

      return Right(response);
    } on DioException catch (error) {
      // _logger.e('getAppSettings', error.errorMessage, stacktrace);

      return Left(
        AppSettingsFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      // _logger.e('getAppSettings', error, stacktrace);

      return Left(AppSettingsFailure(code: 1, message: error.toString()));
    }
  }

  // @override
  // Future<Either<Failure, List<FeatureToggleModel>>> getFeatureToggles()async{
  //   try {
  //     final response = await _dataSource.getFeatureToggles();

  //     return Right(response);
  //   } on DioException catch (error, stacktrace) {
  //     _logger.e('getFeatureToggles', error.errorMessage, stacktrace);

  //     return Left(
  //       AppSettingsFailure(
  //         code: error.response?.statusCode ?? 1,
  //         message: error.message,
  //       ),
  //     );
  //   } catch (error, stacktrace) {
  //     _logger.e('getFeatureToggles', error, stacktrace);

  //     return Left(AppSettingsFailure(code: 1, message: error.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, void>> setFirebaseId(String token) async {
  //   try {
  //     final response = await _dataSource.setFirebaseId(token);

  //     return Right(response);
  //   } on DioException catch (error, stacktrace) {
  //     _logger.e('setFirebaseId', error.errorMessage, stacktrace);

  //     return Left(
  //       AppSettingsFailure(
  //         code: error.response?.statusCode ?? 1,
  //         message: error.message,
  //       ),
  //     );
  //   } catch (error, stacktrace) {
  //     _logger.e('setFirebaseId', error, stacktrace);

  //     return Left(AppSettingsFailure(code: 1, message: error.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, void>> updateDeviceVersion({
  //   required String deviceModel,
  //   required String deviceSystem,
  //   required String deviceVersion,
  //   required String appVersion,
  //   required String appBuild,
  // }) async {
  //   try {
  //     final response = await _dataSource.updateDeviceVersion(
  //       deviceModel: deviceModel,
  //       deviceSystem: deviceSystem,
  //       deviceVersion: deviceVersion,
  //       appVersion: appVersion,
  //       appBuild: appBuild,
  //     );

  //     return Right(response);
  //   } on DioException catch (error, stacktrace) {
  //     _logger.e('updateDeviceVersion', error.errorMessage, stacktrace);

  //     return Left(
  //       AppSettingsFailure(
  //         code: error.response?.statusCode ?? 1,
  //         message: error.message,
  //       ),
  //     );
  //   } catch (error, stacktrace) {
  //     _logger.e('updateDeviceVersion', error, stacktrace);

  //     return Left(AppSettingsFailure(code: 1, message: error.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, void>> updateLastVisit() async {
  //   try {
  //     final response = await _dataSource.updateLastVisit();

  //     return Right(response);
  //   } on DioException catch (error, stacktrace) {
  //     _logger.e('updateDeviceVersion', error.errorMessage, stacktrace);

  //     return Left(
  //       AppSettingsFailure(
  //         code: error.response?.statusCode ?? 1,
  //         message: error.message,
  //       ),
  //     );
  //   } catch (error, stacktrace) {
  //     _logger.e('updateDeviceVersion', error, stacktrace);

  //     return Left(AppSettingsFailure(code: 1, message: error.toString()));
  //   }
  // }
}
