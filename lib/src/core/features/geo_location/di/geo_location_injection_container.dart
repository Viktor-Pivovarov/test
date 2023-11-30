import 'package:get_it/get_it.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:xander9112/xander9112.dart';

class GeoLocationInjection extends ServiceLocator {
  static final GetIt sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    sl.registerFactory(() => GeoLocationRouter(sl()));
  }

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    if (useMock) {
      sl.registerFactory<GeoLocationDataSource>(
        MockGeoLocationDataSource.new,
      );
    } else {
      sl.registerFactory<GeoLocationDataSource>(
        () => RestGeoLocationDataSource(
          sl<DioApiClient>().dio,
        ),
      );
    }
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<GeoLocationRepository>(
      () => GeoLocationRepositoryImpl(sl()),
    );
  }

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory(
      () => GeoLocationCubit(
        repository: sl(),
        router: sl(),
      ),
    );
  }
}
