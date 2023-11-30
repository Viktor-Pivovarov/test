part of 'city_cubit.dart';

@freezed
class CityState with _$CityState {
  const factory CityState.initial({
    @Default(
      LocationModel(
        coordinate: CoordinateModel(),
      ),
    )
    LocationModel location,
    @Default(StateStatus.pure) StateStatus status,
    @Default(true) bool isEditing,
    @Default(false) bool isValid,
    AuthenticatedUser? user,
  }) = _Initial;

  const CityState._();
}
