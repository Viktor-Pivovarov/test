import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_model.freezed.dart';
part 'photo_model.g.dart';

enum PhotoStatus { deleted, pending, active, rejected }

@freezed
class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    required int id,
    required String image,
    @Default(false) bool isCover,
    @Default(0) int position,
    @Default(PhotoStatus.pending) PhotoStatus status,
  }) = _PhotoModel;

  const PhotoModel._();

  factory PhotoModel.fromJson(Object? json) =>
      _$PhotoModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
