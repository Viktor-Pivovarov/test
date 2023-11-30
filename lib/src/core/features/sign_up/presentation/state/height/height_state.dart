part of 'height_cubit.dart';

@freezed
class HeightState with _$HeightState {
  const factory HeightState.initial({
    @Default(171) int height,
    @Default(StateStatus.pure) StateStatus status,
    @Default(true) bool isEditing,
    @Default(false) bool isValid,
    @Default(true) bool disabled,
    AuthenticatedUser? user,
  }) = _Initial;

  const HeightState._();
}
