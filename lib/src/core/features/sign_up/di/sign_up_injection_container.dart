// ignore_for_file: cascade_invocations
import 'package:jojo/src/core/_core.dart';
import 'package:x_logger/x_logger.dart';
import 'package:xander9112/xander9112.dart';

class SignUpInjection extends ServiceLocator {
  static final sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    // sl.registerFactory<SignUpRouter>(() => SignUpRouter(sl()));
  }

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<RestSignUpDataSource>(
      useMock
          ? MockSignUpDataSource.new
          : () => RestSignUpDataSource(sl<DioApiClient>().dio),
    );
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<SignUpRepository>(
      () => SignUpRepositoryImpl(
        sl(),
        sl<XLogger>(param1: SignUpRepository),
      ),
    );
  }

  @override
  Future<void> initUseCases({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory(() => SignOutCase(sl(), sl()));
    sl.registerFactory(() => GoToSignUpCase(sl()));
    sl.registerFactory(() => GoToGeoLocationCase(sl()));
    sl.registerFactory(() => GoToStepsCase(sl()));
    sl.registerFactory(() => GoToNotificationCase(sl()));
    sl.registerFactory(() => GetUserCase(sl()));
  }

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    sl
      ..registerFactory(
        () => NameChoiceCubit(
          repository: sl(),
          getUserCase: sl(),
          notifyService: sl(),
        ),
      )
      ..registerFactory(
        () => BirthdayDateCubit(
          repository: sl(),
          getUserCase: sl(),
          notifyService: sl(),
        ),
      )
      ..registerFactory(
        () => HeightCubit(
          repository: sl(),
          getUserCase: sl(),
          notifyService: sl(),
        ),
      )
      ..registerFactory(
        () => BirthdayTimeCubit(
          repository: sl(),
          getUserCase: sl(),
          notifyService: sl(),
        ),
      )
      ..registerFactory(
        () => CityCubit(
          repository: sl(),
          getUserCase: sl(),
          geoLocationRouter: sl(),
          notifyService: sl(),
        ),
      )
      ..registerFactory(
        () => LanguagesStepCubit(
          repository: sl(),
          getUserCase: sl(),
          dictRepository: sl(),
          notifyService: sl(),
          appSettingsCubit: sl(),
        ),
      )
      ..registerFactory(
        () => PhotosStepCubit(
          repository: sl(),
          photosRepository: PhotosRepositoryImpl(
            dataSource: RestSignUpPhotoDataSource(sl<DioApiClient>().dio),
          ),
          getUserCase: sl(),
          authManager: sl(),
          notifyService: sl(),
          router: sl(),
        ),
      )
      ..registerFactory(
        () => SearchAgeCubit(
          repository: sl(),
          getUserCase: sl(),
          notifyService: sl(),
        ),
      )
      ..registerFactory(
        () => BiometryCubit(
          repository: sl(),
          getUserCase: sl(),
          authManager: sl(),
          router: sl(),
          notifyService: sl(),
        ),
      )
      ..registerFactory(
        () => WelcomeCubit(
          repository: sl(),
          getUserCase: sl(),
          router: sl(),
          notifyService: sl(),
        ),
      );

    sl.registerFactory(
      () => SignUpStepsCubit(
        authManager: sl(),
        signUpRepository: sl(),
        signOutCase: sl(),
        steps: <StepEnum, AbstractRegisterStep>{
          NameChoiceCubit.id: SignUpInjection.sl<NameChoiceCubit>(),
          BirthdayDateCubit.id: SignUpInjection.sl<BirthdayDateCubit>(),
          HeightCubit.id: SignUpInjection.sl<HeightCubit>(),
          BirthdayTimeCubit.id: SignUpInjection.sl<BirthdayTimeCubit>(),
          CityCubit.id: SignUpInjection.sl<CityCubit>(),
          LanguagesStepCubit.id: SignUpInjection.sl<LanguagesStepCubit>(),
          PhotosStepCubit.id: SignUpInjection.sl<PhotosStepCubit>(),
          SearchAgeCubit.id: SignUpInjection.sl<SearchAgeCubit>(),
          BiometryCubit.id: SignUpInjection.sl<BiometryCubit>(),
          BiometryCubit.id: SignUpInjection.sl<BiometryCubit>(),
          WelcomeCubit.id: SignUpInjection.sl<WelcomeCubit>(),
        },
      ),
    );
  }
}
