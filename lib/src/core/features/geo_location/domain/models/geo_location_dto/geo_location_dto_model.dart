import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';

part 'geo_location_dto_model.freezed.dart';
part 'geo_location_dto_model.g.dart';

@freezed
class GeoLocationDTOModel with _$GeoLocationDTOModel {
  const factory GeoLocationDTOModel({
    @Default(<GeoLocationModel>[]) List<GeoLocationModel> items,
  }) = _GeoLocationDTOModel;

  factory GeoLocationDTOModel.fromJson(Object? json) =>
      _$GeoLocationDTOModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
