import 'package:xander9112/xander9112.dart';

class FeedbackFailure extends Failure {
  FeedbackFailure({
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
