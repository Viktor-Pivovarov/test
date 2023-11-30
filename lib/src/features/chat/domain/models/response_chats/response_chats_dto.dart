import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/chat/_chat.dart';

part 'response_chats_dto.freezed.dart';
part 'response_chats_dto.g.dart';

@freezed
class ResponseChatsDTO with _$ResponseChatsDTO {
  const factory ResponseChatsDTO({
    required PaginationDTO pagination,
    @Default(<ChatDTO>[]) List<ChatDTO> items,
  }) = _ResponseChatsDTO;

  factory ResponseChatsDTO.fromJson(Map<String, dynamic> json) =>
      _$ResponseChatsDTOFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
