// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

enum Status {
  onRegister,
  onModeration,
  onReModeration,
  isBlocked,
  isActive,
}

enum SearchStatus {
  readyForSearch,
  pairIsAssigned,
  frozen,
}

@freezed
class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    required String userId,
    required SettingsModel settings,
    required AccountModel account,
    required VedicModel vedic,
    @Default(Status.onRegister) @JsonKey(name: 'status') Status status,
    @JsonKey(
      toJson: toJsonDateTime,
      fromJson: fromJsonDateTime,
    )
    DateTime? positiveModifiedAt,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Object? json) =>
      _$UserInfoModelFromJson(json! as Map<String, dynamic>);

  const UserInfoModel._();

  @override
  Map<String, dynamic> toJson();

  bool get onRegister => Status.onRegister == status;

  bool get isActive => Status.isActive == status;

  bool get onModerate => Status.onModeration == status;

  bool get onReModerate => Status.onReModeration == status;

  bool get isModeration => onModerate || onReModerate;
}
