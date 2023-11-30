import 'package:xander9112/xander9112.dart';

class AppSettingsFailure extends Failure {
  AppSettingsFailure({
    required super.code,
    super.message,
  });

  @override
  String getLocalizedString() {
    switch (code) {
      case 500:
        return 'internalError';
      default:
        return 'unknownError';
    }
  }
}
