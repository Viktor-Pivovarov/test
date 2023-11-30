import 'package:jojo/src/features/chat/_chat.dart';

class ChatMessageEvent {
  ChatMessageEvent({required this.chatId, required this.message});

  final String chatId;
  final ChatMessageDTO message;
}
