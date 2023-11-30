import 'package:jojo_sdk/jojo_sdk.dart';

// ignore: one_member_abstracts
abstract class AppSettingsRepository {
  Future<Either<Failure, AppSettingsModel>> getAppSettings();

  // Future<Either<Failure, List<FeatureToggleModel>>> getFeatureToggles();

  // Future<Either<Failure, void>> updateLastVisit();

  // Future<Either<Failure, void>> setFirebaseId(String token);

  // Future<Either<Failure, void>> updateDeviceVersion({
  //   required String deviceModel,
  //   required String deviceSystem,
  //   required String deviceVersion,
  //   required String appVersion,
  //   required String appBuild,
  // });
}
