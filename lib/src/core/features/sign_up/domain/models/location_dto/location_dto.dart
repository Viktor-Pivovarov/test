import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@freezed
class LocationDTO with _$LocationDTO {
  const factory LocationDTO({
    required PositionDTO coordinate,
    String? city,
  }) = _LocationDTO;

  factory LocationDTO.fromJson(Map<String, dynamic> json) =>
      _$LocationDTOFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
