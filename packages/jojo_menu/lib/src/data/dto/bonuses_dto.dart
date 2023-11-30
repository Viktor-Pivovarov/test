import 'package:freezed_annotation/freezed_annotation.dart';

part 'bonuses_dto.freezed.dart';
part 'bonuses_dto.g.dart';

@freezed
class BonusesDto with _$BonusesDto {
  const factory BonusesDto({
    required BonusesDataDto bonuses,
  }) = _BonusesDto;

  factory BonusesDto.fromJson(Object? json) =>
      _$BonusesDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}

@freezed
class BonusesDataDto with _$BonusesDataDto {
  const factory BonusesDataDto({
    @JsonKey(name: 'is_invite') required bool isInvite,
    @JsonKey(name: 'is_feedback') required bool isFeedback,
    @JsonKey(name: 'is_profile_filling') required bool isProfileFilling,
  }) = _BonusesDataDto;

  factory BonusesDataDto.fromJson(Object? json) =>
      _$BonusesDataDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
