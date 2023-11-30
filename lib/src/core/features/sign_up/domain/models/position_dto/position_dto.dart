import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_dto.freezed.dart';
part 'position_dto.g.dart';

@freezed
class PositionDTO with _$PositionDTO {
  const factory PositionDTO({
    required double longitude,
    required double latitude,
  }) = _PositionDTO;

  factory PositionDTO.fromJson(Map<String, dynamic> json) =>
      _$PositionDTOFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
