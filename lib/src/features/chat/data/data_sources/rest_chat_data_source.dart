import 'package:dio/dio.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_chat_data_source.g.dart';

@RestApi()
abstract class RestChatDataSource implements ChatDataSource {
  factory RestChatDataSource(Dio dio, {String baseUrl}) = _RestChatDataSource;

  @override
  @GET('/v1/chats-active')
  Future<ResponseChatsDTO> getChats();

  @override
  @GET('/v1/chats-pending')
  Future<ResponsePendingChatsDTO> getChatsPending();

  @override
  @GET('/v1/chats/{id}')
  Future<ChatDTO> getChat(@Path('id') String id);

  @override
  @POST('/chat/{id}/block')
  Future<void> blockChat(@Path('id') String id);

  @override
  @DELETE('/chat/{id}/delete')
  Future<void> deleteChat(@Path('id') String id);

  @override
  @POST('/v1/chats/{id}/send-message')
  Future<SendChatMessageResponseDTO> sendMessage(
    @Path('id') String id,
    @Field('message') String message,
  );

  @override
  @PUT('/v1/chats/{id}/notification-accept')
  Future<void> chatNotificationAccept(@Path('id') String id);

  @override
  @PUT('/v1/chats/{id}/notification-decline')
  Future<void> chatNotificationDecline(@Path('id') String id);

// Изменение видимости чата:
// PUT       api/v1/chats/{chat}/visibility-accept
// PUT       api/v1/chats/{chat}/visibility-decline
}
