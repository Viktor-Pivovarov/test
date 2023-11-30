import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
class FeedbackModel with _$FeedbackModel {
  const factory FeedbackModel({
    required int rate,
    required List<int>? reasons,
    required String? message,
  }) = _FeedbackModel;

  factory FeedbackModel.fromJson(Object? json) =>
      _$FeedbackModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
