import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'chat_interlocutor_dto.freezed.dart';
part 'chat_interlocutor_dto.g.dart';

@freezed
class ChatInterlocutorDTO with _$ChatInterlocutorDTO {
  const factory ChatInterlocutorDTO({
    required String photo,
    required String firstName,
    @Default(Gender.female) Gender gender,
  }) = _ChatInterlocutorDTO;

  factory ChatInterlocutorDTO.fromJson(Object? json) =>
      _$ChatInterlocutorDTOFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
