// ignore_for_file: cascade_invocations
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:x_logger/x_logger.dart';
import 'package:xander9112/xander9112.dart';

class ProfileInjection extends ServiceLocator {
  static final sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    sl.registerFactory<ProfileRouter>(
      () => ProfileRouter(sl()),
    );
  }

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    if (useMock) {
      sl.registerFactory<ProfileDataSource>(MockProfileDataSource.new);
    } else {
      sl.registerFactory<ProfileDataSource>(
        () => RestProfileDataSource(sl<DioApiClient>().dio),
      );
    }
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<ProfileRepository>(
      () => ProfileRepositoryImpl(
        dataSource: sl(),
        authManager: sl(),
        logger: sl<XLogger>(param1: ProfileRepository),
      ),
    );
  }

  @override
  Future<void> initUseCases({EnvConfig? env, bool useMock = false}) async {}

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    sl
      ..registerSingleton<ProfileCubit>(
        ProfileCubit(
          authManager: AuthInjection.sl(),
          router: sl(),
          repository: sl(),
          notifyService: sl(),
          geoLocationRouter: sl(),
          dictRepository: sl(),
          eventBus: sl(),
        ),
      )
      ..registerFactory<ProfilePhotosCubit>(
        () => ProfilePhotosCubit(
          authManager: AuthInjection.sl(),
          notifyService: sl(),
          photosRepository: PhotosRepositoryImpl(
            dataSource: RestProfilePhotoDataSource(sl<DioApiClient>().dio),
          ),
        ),
      )
      ..registerFactory<ProfileQuestionnaireCubit>(
        () => ProfileQuestionnaireCubit(
          authManager: AuthInjection.sl(),
          repository: sl(),
          dictRepository: sl(),
          notifyService: sl(),
        ),
      );
  }
}
