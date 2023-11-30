import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_model.freezed.dart';
part 'step_model.g.dart';

enum StepEnum {
  firstName,
  birthday,
  height,
  birthtime,
  cityBorn,
  languages,
  photo,
  searchAge,
  searchHeight,
  biometry,
  welcome,
  complete
}

@freezed
class StepModel with _$StepModel {
  const factory StepModel({
    required int position,
    required StepEnum step,
    required String name,
    required double delay,
  }) = _StepModel;

  factory StepModel.fromJson(Map<String, dynamic> json) =>
      _$StepModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
