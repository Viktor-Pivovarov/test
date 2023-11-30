// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings_model.freezed.dart';
part 'user_settings_model.g.dart';

@freezed
class UserSettingsModel with _$UserSettingsModel {
  const factory UserSettingsModel({
    @Default(false) bool allowGeolocation,
    @Default(false) bool allowNotificationMutualSympathyOffer,
    @Default(false) bool allowNotificationNewChatMessage,
    @Default(false) bool allowNotificationNewStackOffer,
  }) = _UserSettingsModel;

  factory UserSettingsModel.fromJson(Object? json) =>
      _$UserSettingsModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
