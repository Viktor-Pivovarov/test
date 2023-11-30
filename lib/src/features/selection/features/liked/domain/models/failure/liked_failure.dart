import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class LikedFailure extends Failure {
  LikedFailure({
    required super.code,
    required super.message,
  });

  @override
  String getLocalizedString() {
    switch (code) {
      case 500:
        return CoreI18n.internalError;
      case 404:
        return LikedI18n.likedNotFound;
      default:
        return CoreI18n.unknownError;
    }
  }
}
