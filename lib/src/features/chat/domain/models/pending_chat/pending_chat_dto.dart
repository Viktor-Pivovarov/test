import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/chat/_chat.dart';

part 'pending_chat_dto.freezed.dart';
part 'pending_chat_dto.g.dart';

@freezed
class PendingChatDTO with _$PendingChatDTO {
  const factory PendingChatDTO({
    required String id,
    required PendingChatInterlocutorDTO interlocutor,
    @Default(false) bool isNew,
  }) = _PendingChatDTO;

  factory PendingChatDTO.fromJson(Object? json) =>
      _$PendingChatDTOFromJson(json! as Map<String, dynamic>);

  const PendingChatDTO._();

  @override
  Map<String, dynamic> toJson();

  String? get lastVisitString {
    return null;

    // if (lastVisit == null && isOnline) {
    //   return null;
    // }

    // if (DateTime.now().difference(lastVisit!).inHours < 24) {
    //   return 'recently';
    // }

    // if (DateTime.now().difference(lastVisit!).inHours < 48) {
    //   return 'yesterday';
    // }

    // return DateFormat.yMd().format(lastVisit!);
  }
}
