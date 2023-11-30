import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/chat/_chat.dart';

part 'response_pending_chats_dto.freezed.dart';
part 'response_pending_chats_dto.g.dart';

@freezed
class ResponsePendingChatsDTO with _$ResponsePendingChatsDTO {
  const factory ResponsePendingChatsDTO({
    required PaginationDTO pagination,
    @Default(<PendingChatDTO>[]) List<PendingChatDTO> items,
    @Default(0) int count,
  }) = _ResponsePendingChatsDTO;

  factory ResponsePendingChatsDTO.fromJson(Map<String, dynamic> json) =>
      _$ResponsePendingChatsDTOFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
