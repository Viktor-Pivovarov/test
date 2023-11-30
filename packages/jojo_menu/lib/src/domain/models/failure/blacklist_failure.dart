import 'package:xander9112/xander9112.dart';

class BlacklistFailure extends Failure {
  BlacklistFailure({
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
