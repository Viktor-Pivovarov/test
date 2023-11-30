part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    LocationPermission? locationPermission,
    Gender? gender,
    PickupTime? pickupTime,
    bool? agreeForVedic,
    bool? agreeForPay,
    bool? agreeForSelfie,
    bool? geoLocationEnabled,
    double? latitude,
    double? longitude,
    SignUpType? type,
    bool? consent,
  }) = _Initial;

  factory AuthState.fromJson(Object? json) =>
      _$AuthStateFromJson(json! as Map<String, dynamic>);

  const AuthState._();

  @override
  Map<String, dynamic> toJson();
}
