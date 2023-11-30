// ignore_for_file: invalid_annotation_target, avoid_final_parameters

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'user.entity.freezed.dart';
part 'user.entity.g.dart';

@freezed
class AuthenticatedUser with _$AuthenticatedUser {
  const factory AuthenticatedUser({
    required int userId,
    required SettingsModel settings,
    required AccountModel account,
    required VedicModel vedic,
    required PreferenceModel preference,
    required SearcherModel searcher,
    required ProfileModel profile,
    PhotoModel? biometric,
    PhotoModel? examination,
    @Default(false) bool isTelegramBotActive,
  }) = _AuthenticatedUser;

  factory AuthenticatedUser.fromJson(Object? json) =>
      _$AuthenticatedUserFromJson(json! as Map<String, dynamic>);

  const AuthenticatedUser._();

  @override
  Map<String, dynamic> toJson();

  bool get isAuthenticatedUser => userId != -1;
}
