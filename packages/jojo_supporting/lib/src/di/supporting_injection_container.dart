import 'package:get_it/get_it.dart';
import 'package:jojo_supporting/jojo_supporting.dart';
import 'package:xander9112/xander9112.dart';

class SupportingInjection extends ServiceLocator {
  static final GetIt sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    sl.registerFactory(() => SupportingRouter(sl()));
  }

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    if (useMock) {
      sl.registerFactory<SupportingDataSource>(
        MockSupportingDataSource.new,
      );
    } else {
      sl.registerFactory<SupportingDataSource>(
        () => RestSupportingDataSource(
          sl<DioApiClient>().dio,
        ),
      );
    }
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<SupportingRepository>(
      () =>
          SupportingRepositoryImpl(sl(), sl(param1: SupportingRepositoryImpl)),
    );
  }

  @override
  Future<void> initUseCases({EnvConfig? env, bool useMock = false}) async {
    sl
      ..registerFactory<CreateRequestUseCase>(() => CreateRequestUseCase(sl()))
      ..registerFactory<GetProfileEmailUseCase>(
        () => GetProfileEmailUseCase(sl()),
      );
  }

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory(
      () => SupportingCubit(
        createRequestUseCase: sl(),
        getProfileEmailUseCase: sl(),
        notifyService: sl(),
      ),
    );
  }
}
