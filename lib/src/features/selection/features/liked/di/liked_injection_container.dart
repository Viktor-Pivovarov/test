import 'package:get_it/get_it.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:xander9112/xander9112.dart';

class LikedInjection extends ServiceLocator {
  static final GetIt sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    sl.registerFactory(() => LikedRouter(sl()));
  }

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    if (useMock) {
      sl.registerFactory<LikedDataSource>(
        MockLikedDataSource.new,
      );
    } else {
      sl.registerFactory<LikedDataSource>(
        () => RestLikedDataSource(
          sl<DioApiClient>().dio,
        ),
      );
    }
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<LikedRepository>(() => LikedRepositoryImpl(sl()));
  }

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory(
      () => LikedCubit(
        repository: sl(),
        authManager: sl(),
        selectionRouter: sl(),
      ),
    );
  }
}
