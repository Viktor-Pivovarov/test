import 'package:xander9112/xander9112.dart';

class AccountStatusFailure extends Failure {
  AccountStatusFailure({
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
