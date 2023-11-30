import 'package:get_it/get_it.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class NavigationInjection extends ServiceLocator {
  static final GetIt sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    sl
      ..registerLazySingleton<RootStackRouter>(
        AppAutoRouter.new,
      )
      ..registerFactory(() => PopCase(sl()));
  }
}
