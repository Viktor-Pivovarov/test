import 'package:jojo_sdk/jojo_sdk.dart';

class MockAppSettingsDataSource implements AppSettingsDataSource {
  @override
  Future<AppSettingsModel> getAppSettings() async {
    return const AppSettingsModel(
      engineeringWorks: EngineeringWorksModel(),
      latestApplicationVersions:
          LatestApplicationVersionsModel(android: '1.0.1', ios: '1.0.1'),
    );
  }

  @override
  Future<void> setFirebaseId(String token) {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> updateDeviceVersion({
    required String deviceModel,
    required String deviceSystem,
    required String deviceVersion,
    required String appVersion,
    required String appBuild,
  }) {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> updateLastVisit() {
    return Future.delayed(const Duration(seconds: 1));
  }
}
