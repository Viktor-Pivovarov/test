import 'package:jojo_sdk/jojo_sdk.dart';

abstract class AppSettingsDataSource {
  Future<AppSettingsModel> getAppSettings();

  Future<void> setFirebaseId(String token);

  Future<void> updateDeviceVersion({
    required String deviceModel,
    required String deviceSystem,
    required String deviceVersion,
    required String appVersion,
    required String appBuild,
  });

  Future<void> updateLastVisit();
}
