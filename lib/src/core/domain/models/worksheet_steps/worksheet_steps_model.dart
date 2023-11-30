import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';

part 'worksheet_steps_model.freezed.dart';
part 'worksheet_steps_model.g.dart';

@freezed
class WorksheetStepsModel with _$WorksheetStepsModel {
  const factory WorksheetStepsModel({
    @Default(<StepModel>[]) List<StepModel> steps,
    @Default(StepEnum.firstName) StepEnum currentStep,
  }) = _WorksheetStepsModel;

  factory WorksheetStepsModel.fromJson(Map<String, dynamic> json) =>
      _$WorksheetStepsModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
