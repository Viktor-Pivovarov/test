import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'version_model.freezed.dart';
part 'version_model.g.dart';

@freezed
class VersionModel with _$VersionModel {
  const factory VersionModel({
    required String android,
    required String ios,
    @Default(false) bool engineeringWorks,
  }) = _VersionModel;

  const VersionModel._();

  factory VersionModel.fromJson(Object? json) =>
      _$VersionModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();

  String get currentVersion {
    if (isAndroid()) {
      return android;
    }

    if (isIOS()) {
      return ios;
    }

    return '';
  }
}
