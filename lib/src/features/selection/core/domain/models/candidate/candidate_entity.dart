import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'candidate_entity.freezed.dart';
part 'candidate_entity.g.dart';

@freezed
class CandidateEntity with _$CandidateEntity {
  const factory CandidateEntity({
    required String name,
    required int age,
    required int height,
    required ZodiacEnum zodiac,
    @Default([]) List<String> photos,
    String? bio,
    DictModel? education,
    DictModel? sphere,
    DictModel? professionalStatus,
    DictModel? religion,
    DictModel? familyPlan,
    DictModel? smokeStatus,
    DictModel? alcoholStatus,
    DictModel? foodPreference,
    DictModel? workout,
    DictModel? sleepHabit,
    DictModel? covid,
    @Default(<DictModel>[]) List<DictModel> languages,
    @Default(<DictModel>[]) List<DictModel> idealMeetingPoints,
    @Default(<DictModel>[]) List<DictModel> pets,
    @Default(<DictModel>[]) List<DictModel> interests,
    @Default(<DictModel>[]) List<DictModel> biometrics,
  }) = _CandidateEntity;

  factory CandidateEntity.fromJson(Object? json) =>
      _$CandidateEntityFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
