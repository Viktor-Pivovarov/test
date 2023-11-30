import 'package:jojo/src/features/chat/_chat.dart';
import 'package:xander9112/xander9112.dart';

// ignore: one_member_abstracts
abstract class ChatRepository {
  Future<Either<Failure, ResponseChatsDTO>> getChats();

  Future<Either<Failure, ResponsePendingChatsDTO>> getChatsPending();

  Future<Either<Failure, ChatDTO>> getChat(String id);

  Future<Either<Failure, SendChatMessageResponseDTO>> sendMessage(
    String id,
    String message,
  );

  Future<Either<Failure, void>> blockChat(String id);

  Future<Either<Failure, void>> deleteChat(String id);

  Future<Either<Failure, void>> chatNotificationAccept(String id);

  Future<Either<Failure, void>> chatNotificationDecline(String id);
}
