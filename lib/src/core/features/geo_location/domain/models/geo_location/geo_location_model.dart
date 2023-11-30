import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'geo_location_model.freezed.dart';
part 'geo_location_model.g.dart';

@freezed
class GeoLocationModel with _$GeoLocationModel {
  const factory GeoLocationModel({
    required String name,
    @JsonKey(fromJson: fromJsonStringToDouble, toJson: toJsonStringToDouble)
    double? latitude,
    @JsonKey(fromJson: fromJsonStringToDouble, toJson: toJsonStringToDouble)
    double? longitude,
  }) = _GeoLocationModel;

  factory GeoLocationModel.fromJson(Object? json) =>
      _$GeoLocationModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
