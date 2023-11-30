import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    @Default(false) bool allowGeolocation,
    @Default(false) bool allowNotificationMutualSympathyOffer,
    @Default(false) bool allowNotificationNewChatMessage,
    @Default(false) bool allowNotificationNewStackOffer,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Object? json) =>
      _$SettingsModelFromJson(json! as Map<String, dynamic>);

  const SettingsModel._();

  @override
  Map<String, dynamic> toJson();
}
