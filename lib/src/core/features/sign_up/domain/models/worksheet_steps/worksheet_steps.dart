import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';

part 'worksheet_steps.freezed.dart';
part 'worksheet_steps.g.dart';

@freezed
class WorksheetStepsResponseModel with _$WorksheetStepsResponseModel {
  const factory WorksheetStepsResponseModel({
    required StepEnum currentStep,
    @Default(<StepModel>[]) List<StepModel> steps,
  }) = _WorksheetStepsResponseModel;

  factory WorksheetStepsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WorksheetStepsResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
