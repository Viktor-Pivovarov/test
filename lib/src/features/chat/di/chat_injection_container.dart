import 'package:get_it/get_it.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:xander9112/xander9112.dart';

class ChatInjection extends ServiceLocator {
  static final GetIt sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    sl.registerFactory(() => ChatRouter(sl()));
  }

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<ChatDataSource>(
      () => useMock
          ? MockChatDataSource()
          : RestChatDataSource(sl<DioApiClient>().dio),
    );
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory<ChatRepository>(() => ChatRepositoryImpl(sl()));
  }

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    sl
      ..registerFactory(
        () => ChatsCubit(
          repository: sl(),
          router: sl(),
          appMetrics: sl(),
          eventBus: sl(),
        ),
      )
      ..registerFactory(
        () => ChatCubit(
          repository: sl(),
          eventBus: sl(),
        ),
      );
  }
}
