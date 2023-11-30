import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_entity.freezed.dart';
part 'photo_entity.g.dart';

@freezed
class PhotoEntity with _$PhotoEntity {
  const factory PhotoEntity({
    required List<int> image,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    double? percent,
  }) = _PhotoEntity;

  factory PhotoEntity.fromJson(Map<String, dynamic> json) =>
      _$PhotoEntityFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
