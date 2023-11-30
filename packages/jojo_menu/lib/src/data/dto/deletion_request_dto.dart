import 'package:freezed_annotation/freezed_annotation.dart';

part 'deletion_request_dto.freezed.dart';
part 'deletion_request_dto.g.dart';

@freezed
class DeletionRequestDto with _$DeletionRequestDto {
  const factory DeletionRequestDto({
    required List<int> reasons,
  }) = _DeletionRequestDto;

  factory DeletionRequestDto.fromJson(Object? json) =>
      _$DeletionRequestDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
