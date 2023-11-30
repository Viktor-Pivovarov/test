import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_photos_request_dto.freezed.dart';
part 'sort_photos_request_dto.g.dart';

@freezed
class SortPhotosRequestDTO with _$SortPhotosRequestDTO {
  const factory SortPhotosRequestDTO({
    @Default([]) List<SortPhotoItemDTO> sortedPhotos,
  }) = _SortPhotosRequestDTO;

  factory SortPhotosRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$SortPhotosRequestDTOFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
class SortPhotoItemDTO with _$SortPhotoItemDTO {
  const factory SortPhotoItemDTO({
    required int id,
    required int position,
  }) = _SortPhotoItemDTO;

  factory SortPhotoItemDTO.fromJson(Map<String, dynamic> json) =>
      _$SortPhotoItemDTOFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
