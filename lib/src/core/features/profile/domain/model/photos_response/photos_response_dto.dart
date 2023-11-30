import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'photos_response_dto.freezed.dart';
part 'photos_response_dto.g.dart';

@freezed
class PhotosResponseDTO with _$PhotosResponseDTO {
  const factory PhotosResponseDTO({
    @Default([]) List<PhotoModel> items,
  }) = _PhotosResponseDTO;

  factory PhotosResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotosResponseDTOFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
