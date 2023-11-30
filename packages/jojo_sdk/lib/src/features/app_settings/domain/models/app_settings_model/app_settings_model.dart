import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_model.freezed.dart';
part 'app_settings_model.g.dart';

@freezed
class AppSettingsModel with _$AppSettingsModel {
  const factory AppSettingsModel({
    required EngineeringWorksModel engineeringWorks,
    required LatestApplicationVersionsModel latestApplicationVersions,
  }) = _AppSettingsModel;

  factory AppSettingsModel.fromJson(Object? json) =>
      _$AppSettingsModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}

@freezed
class EngineeringWorksModel with _$EngineeringWorksModel {
  const factory EngineeringWorksModel({
    @Default(false) bool android,
    @Default(false) bool ios,
  }) = _EngineeringWorksModel;

  factory EngineeringWorksModel.fromJson(Object? json) =>
      _$EngineeringWorksModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}

@freezed
class LatestApplicationVersionsModel with _$LatestApplicationVersionsModel {
  const factory LatestApplicationVersionsModel({
    @Default('1.0.0') String android,
    @Default('1.0.0') String ios,
  }) = _LatestApplicationVersionsModel;

  factory LatestApplicationVersionsModel.fromJson(Object? json) =>
      _$LatestApplicationVersionsModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
