import 'package:jojo_menu/src/_menu.dart';
import 'package:xander9112/xander9112.dart';

class MenuFailure extends Failure {
  MenuFailure({
    required super.code,
    required super.message,
  });

  @override
  String getLocalizedString() {
    switch (code) {
      case 500:
        return 'internalError';
      case 404:
        return MenuI18n.menuNotFound;

      default:
        return 'unknownError';
    }
  }
}
