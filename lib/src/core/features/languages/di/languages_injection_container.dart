import 'package:get_it/get_it.dart';
import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:xander9112/xander9112.dart';

class LanguagesInjection extends ServiceLocator {
  static final GetIt sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    sl.registerFactory(() => LanguagesRouter(sl()));
  }

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    sl.registerFactory(() => LanguagesCubit(repository: sl()));
  }
}
