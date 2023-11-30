import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class SelectionRouter extends AppRouter {
  SelectionRouter(super.router);

  void goToSelection() {
    pushNamed(SelectionRoutePath.selection);
  }

  void goToCandidate(int id) {
    pushNamed(SelectionRoutePath.candidate.routeParams({'id': id}));
  }

  void goToSearchParams() {
    pushNamed(SelectionRoutePath.searchParams);
  }

// TODO(afurmanchuk): Подумать как сделать меню дочерним
  void goToMenuAlgorithm() {
    pushNamed(
      '/main/menu/${MenuRoutePath.algorithm}',
      includePrefixMatches: true,
    );
  }

  void goToCompatibility(int id) {
    pushNamed(SelectionRoutePath.compatibility.routeParams({'id': id}));
  }
}
