import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:jojo/src/features/chat/_chat.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

@freezed
class ChatDTO with _$ChatDTO {
  const factory ChatDTO({
    required String id,
    required ChatInterlocutorDTO interlocutor,
    @Default(false) bool isMuted,
    @Default(false) bool isBlocked,
    @Default(false) bool isOnline,
    @Default(0) int unreadCount,
    ChatMessageDTO? lastMessage,
    @Default([]) List<ChatMessageDTO> messages,
    DateTime? lastVisit,
  }) = _ChatDTO;

  factory ChatDTO.fromJson(Object? json) =>
      _$ChatDTOFromJson(json! as Map<String, dynamic>);

  const ChatDTO._();

  @override
  Map<String, dynamic> toJson();

  String? get lastVisitString {
    if (lastVisit == null || isOnline) {
      return null;
    }

    if (DateTime.now().difference(lastVisit!).inHours < 24) {
      return 'recently';
    }

    if (DateTime.now().difference(lastVisit!).inHours < 48) {
      return 'yesterday';
    }

    return DateFormat.yMd().format(lastVisit!);
  }
}
