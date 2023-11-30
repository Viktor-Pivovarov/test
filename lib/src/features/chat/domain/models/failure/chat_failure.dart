import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class ChatFailure extends Failure {
  ChatFailure({
    required super.code,
    required super.message,
  });

  @override
  String getLocalizedString() {
    switch (code) {
      case 500:
        return CoreI18n.internalError;
      case 404:
        return ChatI18n.chatNotFound;
      default:
        return CoreI18n.unknownError;
    }
  }
}
