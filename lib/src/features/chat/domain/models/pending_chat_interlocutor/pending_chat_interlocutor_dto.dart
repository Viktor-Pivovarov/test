import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'pending_chat_interlocutor_dto.freezed.dart';
part 'pending_chat_interlocutor_dto.g.dart';

@freezed
class PendingChatInterlocutorDTO with _$PendingChatInterlocutorDTO {
  const factory PendingChatInterlocutorDTO({
    required String photo,
    required String firstName,
    required int age,
    required OfferEntityCompatibility compatibility,
    @Default(Gender.female) Gender gender,
    @Default(OfferStatus.mutualAttraction) OfferStatus datingStatus,
  }) = _PendingChatInterlocutorDTO;

  factory PendingChatInterlocutorDTO.fromJson(Object? json) =>
      _$PendingChatInterlocutorDTOFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
