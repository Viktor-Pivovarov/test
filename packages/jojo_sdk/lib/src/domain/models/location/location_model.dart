import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required CoordinateModel coordinate,
    String? city,
  }) = _LocationModel;

  factory LocationModel.fromJson(Object? json) =>
      _$LocationModelFromJson(json! as Map<String, dynamic>);

  const LocationModel._();

  @override
  Map<String, dynamic> toJson();
}
