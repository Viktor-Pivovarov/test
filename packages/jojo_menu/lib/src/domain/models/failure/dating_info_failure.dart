import 'package:xander9112/xander9112.dart';

class DatingInfoFailure extends Failure {
  DatingInfoFailure({
    required super.code,
    required super.message,
  });

  @override
  String getLocalizedString() {
    switch (code) {
      default:
        return 'unknownError';
    }
  }
}
