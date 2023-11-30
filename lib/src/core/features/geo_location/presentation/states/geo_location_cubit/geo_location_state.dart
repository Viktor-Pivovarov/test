part of 'geo_location_cubit.dart';

@freezed
class GeoLocationState with _$GeoLocationState {
  const factory GeoLocationState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    @Default(GeoLocationDTOModel()) GeoLocationDTOModel geoLocation,
    GeoLocationModel? selectLocation,
  }) = _GeoLocationInitialState;

  factory GeoLocationState.fromJson(Object? json) =>
      _$GeoLocationStateFromJson(json! as Map<String, dynamic>);

  const GeoLocationState._();

  @override
  Map<String, dynamic> toJson();
}
