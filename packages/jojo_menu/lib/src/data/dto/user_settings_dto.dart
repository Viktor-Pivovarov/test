import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';

part 'user_settings_dto.freezed.dart';
part 'user_settings_dto.g.dart';

@freezed
class UserSettingsDto with _$UserSettingsDto {
  const factory UserSettingsDto({
    required UserSettingsModel settings,
  }) = _UserSettingsDto;

  factory UserSettingsDto.fromJson(Object? json) =>
      _$UserSettingsDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
