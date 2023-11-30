import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_available_info_dto.freezed.dart';
part 'feedback_available_info_dto.g.dart';

@freezed
class FeedbackAvailableInfoDto with _$FeedbackAvailableInfoDto {
  const factory FeedbackAvailableInfoDto({
    required bool available,
  }) = _FeedbackAvailableInfoDto;

  factory FeedbackAvailableInfoDto.fromJson(Object? json) =>
      _$FeedbackAvailableInfoDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}

@freezed
class FeedbackAvailableInfoDataDto with _$FeedbackAvailableInfoDataDto {
  const factory FeedbackAvailableInfoDataDto({
    required bool available,
  }) = _FeedbackAvailableInfoDataDto;

  factory FeedbackAvailableInfoDataDto.fromJson(Object? json) =>
      _$FeedbackAvailableInfoDataDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
