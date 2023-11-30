import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class LanguagesFailure extends Failure {
  LanguagesFailure({
    required super.code,
    required super.message,
  });

  @override
  String getLocalizedString() {
    switch (code) {
      case 500:
        return CoreI18n.internalError;
      case 404:
        return LanguagesI18n.languagesNotFound;
      default:
        return CoreI18n.unknownError;
    }
  }
}
