import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'feedback_reasons_dto.freezed.dart';
part 'feedback_reasons_dto.g.dart';

@freezed
class FeedbackReasonsDto with _$FeedbackReasonsDto {
  const factory FeedbackReasonsDto({
    required List<DictModel> items,
  }) = _FeedbackReasonsDto;

  factory FeedbackReasonsDto.fromJson(Object? json) =>
      _$FeedbackReasonsDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
