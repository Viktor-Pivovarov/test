import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/chat/_chat.dart';

part 'send_chat_message_response_dto.freezed.dart';
part 'send_chat_message_response_dto.g.dart';

@freezed
class SendChatMessageResponseDTO with _$SendChatMessageResponseDTO {
  const factory SendChatMessageResponseDTO({
    required ChatMessageDTO message,
  }) = _SendChatMessageResponseDTO;

  factory SendChatMessageResponseDTO.fromJson(Object? json) =>
      _$SendChatMessageResponseDTOFromJson(json! as Map<String, dynamic>);

  const SendChatMessageResponseDTO._();

  @override
  Map<String, dynamic> toJson();
}
