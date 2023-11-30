import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'deletion_reasons_dto.freezed.dart';
part 'deletion_reasons_dto.g.dart';

@freezed
class DeletionReasonsDto with _$DeletionReasonsDto {
  const factory DeletionReasonsDto({
    required List<DictModel> items,
  }) = _DeletionReasonsDto;

  factory DeletionReasonsDto.fromJson(Object? json) =>
      _$DeletionReasonsDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
