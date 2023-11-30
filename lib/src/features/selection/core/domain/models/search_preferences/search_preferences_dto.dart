import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'search_preferences_dto.freezed.dart';
part 'search_preferences_dto.g.dart';

@freezed
class SearchPreferencesDTO with _$SearchPreferencesDTO {
  const factory SearchPreferencesDTO({
    @Default(0) int distance,
    @Default(0) int ageFrom,
    @Default(0) int ageTo,
    @Default([]) List<DictModel> languages,
  }) = _SearchPreferencesDTO;

  factory SearchPreferencesDTO.fromJson(Map<String, dynamic> json) =>
      _$SearchPreferencesDTOFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
