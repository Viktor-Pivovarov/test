// ignore_for_file: cascade_invocations

import 'package:flutter/foundation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class AuthInjection extends ServiceLocator {
  static final sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    sl.registerFactory<AuthRouter>(() => AuthRouter(sl()));
    sl.registerFactory<SignUpRouter>(() => SignUpRouter(sl()));
  }

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    sl.registerLazySingleton<AuthManager<AuthenticatedUser>>(
      () => AuthManagerImpl(
        repository: sl(),
        appMetrics: sl(),
        settings:
            AuthManagerSettings(useBiometric: !kIsWeb, useLocalAuth: true),
      ),
    );

    if (useMock) {
      sl
        ..registerFactory<RestAuthDataSource>(
          () => MockAuthDataSource(
            sl<DioApiClient>().dio,
          ),
        )
        ..registerFactory<RestOAuthDataSource>(
          MockOAuthDataSource.new,
        );
    } else {
      sl
        ..registerFactory<RestAuthDataSource>(
          () => RestAuthDataSource(sl<DioApiClient>().dio),
        )
        ..registerFactory<RestOAuthDataSource>(
          () => RestOAuthDataSource(sl()),
        );
    }

    final AuthLocalDataSource authLocalDataSource = HiveAuthLocalDatasource();
    await authLocalDataSource.init();

    sl.registerSingleton<AuthLocalDataSource>(authLocalDataSource);
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<AuthRepository<AuthResponseModel, AuthenticatedUser>>(
      () => AuthRepositoryImpl(sl(), sl(), sl(), sl()),
    );
  }

  @override
  Future<void> initUseCases({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory(() => LoginUseCase(sl()));
    sl.registerFactory(() => SignOutUseCase(sl(), sl()));
    sl.registerFactory(() => CheckAuthUseCase(sl()));
    sl.registerFactory(() => GoToAuthSignUpCase(sl()));
    sl.registerFactory(() => SignUpCase(sl()));
  }

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    sl.registerSingleton<AuthCubit>(
      AuthCubit(
        loginUseCase: sl(),
        goToSignUpCase: sl(),
        popCase: sl(),
        signOutUseCase: sl(),
        notifyService: sl(),
        signUpCase: sl(),
        router: sl(),
        manager: sl(),
        repository: sl(),
        geoLocationRouter: sl(),
      ),
    );
  }
}
