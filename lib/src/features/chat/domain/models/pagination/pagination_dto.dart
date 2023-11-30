import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/chat/_chat.dart';

part 'pagination_dto.freezed.dart';
part 'pagination_dto.g.dart';

@freezed
class PaginationDTO with _$PaginationDTO {
  const factory PaginationDTO({
    @Default(<ChatDTO>[]) List<ChatDTO> items,
    int? prevPage,
    int? currentPage,
    int? nextPage,
    @Default(1) int lastPage,
    @Default(100) int perPage,
    @Default(0) int total,
  }) = _PaginationDTO;

  factory PaginationDTO.fromJson(Map<String, dynamic> json) =>
      _$PaginationDTOFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
