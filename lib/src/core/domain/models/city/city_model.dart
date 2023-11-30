import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    required String name,
    required String q,
    String? placeId,
    String? latitude,
    String? longitude,
  }) = _CityModel;

  factory CityModel.fromJson(Object? json) =>
      _$CityModelFromJson(json! as Map<String, dynamic>);

  const CityModel._();

  @override
  Map<String, dynamic> toJson();
}
