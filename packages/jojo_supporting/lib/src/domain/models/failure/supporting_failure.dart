import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_supporting/jojo_supporting.dart';

class SupportingFailure extends Failure {
  SupportingFailure({
    required super.code,
    required super.message,
  });

  @override
  String getLocalizedString() {
    switch (code) {
      case 500:
        return CoreI18n.internalError;
      case 404:
        return SupportingI18n.supportingNotFound;
      default:
        return CoreI18n.unknownError;
    }
  }
}
