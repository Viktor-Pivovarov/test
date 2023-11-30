import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinate_model.freezed.dart';
part 'coordinate_model.g.dart';

@freezed
class CoordinateModel with _$CoordinateModel {
  const factory CoordinateModel({
    double? longitude,
    double? latitude,
  }) = _CoordinateModel;

  factory CoordinateModel.fromJson(Object? json) =>
      _$CoordinateModelFromJson(json! as Map<String, dynamic>);

  const CoordinateModel._();

  @override
  Map<String, dynamic> toJson();
}
