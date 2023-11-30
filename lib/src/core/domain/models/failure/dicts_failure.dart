import 'package:jojo_sdk/jojo_sdk.dart';

class DictFailure extends Failure {
  DictFailure({
    required super.code,
    super.message,
  });

  @override
  String getLocalizedString() {
    switch (code) {
      case 500:
        return CoreI18n.internalError;
      default:
        return CoreI18n.unknownError;
    }
  }
}
