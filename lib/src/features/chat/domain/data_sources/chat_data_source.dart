import 'package:jojo/src/features/chat/_chat.dart';

// ignore: one_member_abstracts
abstract class ChatDataSource {
  Future<ResponseChatsDTO> getChats();

  Future<ResponsePendingChatsDTO> getChatsPending();

  Future<ChatDTO> getChat(String id);

  Future<SendChatMessageResponseDTO> sendMessage(String id, String message);

  Future<void> blockChat(String id);

  Future<void> deleteChat(String id);

  Future<void> chatNotificationAccept(String id);

  Future<void> chatNotificationDecline(String id);
}
