import 'package:get_it/get_it.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo/src/features/selection/core/presentation/states/cubit/demo_cubit.dart';
import 'package:xander9112/xander9112.dart';

class SelectionInjection extends ServiceLocator {
  static final GetIt sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    sl.registerFactory(() => SelectionRouter(sl()));
  }

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    if (useMock) {
      sl.registerFactory<SelectionDataSource>(
        MockSelectionDataSource.new,
      );
    } else {
      sl.registerFactory<SelectionDataSource>(
        () => RestSelectionDataSource(
          sl<DioApiClient>().dio,
        ),
      );
    }
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<SelectionRepository>(
      () => SelectionRepositoryImpl(sl()),
    );
  }

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    sl
      ..registerFactory(
        () => SelectionCubit(
          repository: sl(),
          router: sl(),
          eventBus: sl(),
        ),
      )
      ..registerFactory(
        () => OfferCubit(
          repository: sl(),
          router: sl(),
          eventBus: sl(),
          dictRepository: sl(),
        ),
      )
      ..registerFactory(
        () => SelectionSearchParamsCubit(
          repository: sl(),
          router: sl(),
        ),
      )
      ..registerFactory(
        DemoCubit.new,
      );
  }
}
