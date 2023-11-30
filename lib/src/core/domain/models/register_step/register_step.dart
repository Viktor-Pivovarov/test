// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_step.freezed.dart';
part 'register_step.g.dart';

@freezed
class RegisterStep with _$RegisterStep {
  const factory RegisterStep({
    @JsonKey(name: 'register_step_id') int? id,
    int? status,
    int? position,
  }) = _RegisterStep;

  factory RegisterStep.fromJson(Map<String, dynamic> json) =>
      _$RegisterStepFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
