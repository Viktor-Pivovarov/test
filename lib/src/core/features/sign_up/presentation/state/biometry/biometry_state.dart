part of 'biometry_cubit.dart';

@freezed
class BiometryState with _$BiometryState {
  const factory BiometryState.initial({
    PhotoModel? biometric,
    PhotoModel? examination,
    @Default(StateStatus.pure) StateStatus status,
    @Default(true) bool isEditing,
    @Default(false) bool isValid,
    AuthenticatedUser? user,
    @Default(false) bool isPassVerification,
  }) = _Initial;

  const BiometryState._();
}
