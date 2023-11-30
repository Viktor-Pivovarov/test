import 'package:get_it/get_it.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class AppSettingsInjection extends ServiceLocator {
  static final GetIt sl = ServiceLocator.getSL;

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<AppSettingsDataSource>(() {
      return useMock
          ? MockAppSettingsDataSource()
          : RestAppSettingsDataSource(
              sl<DioApiClient>().dio,
            );
    });
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<AppSettingsRepository>(
      () => AppSettingsRepositoryImpl(sl()),
    );
  }

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    final settingsCubit = AppSettingsCubit(
      appInfo: await AppInfo.getAppInfo(),
      deviceInfo: await AppInfo.getDeviceInfo(),
      deviceId: await AppInfo.getId(),
      repository: sl(),
      appMetrics: sl(),
    );

    sl.registerLazySingleton(() => settingsCubit);
  }
}
