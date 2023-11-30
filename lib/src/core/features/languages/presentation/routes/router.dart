import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class LanguagesRouter extends AppRouter {
  LanguagesRouter(super.router);

  Future<List<int>?> goToLanguages([List<int>? selected]) {
    return pushNamed<List<int>>(
      LanguagesRoutePath.languages.query({'selected': selected?.join(',')}),
    );
  }
}
