part of 'welcome_cubit.dart';

@freezed
class WelcomeState with _$WelcomeState {
  const factory WelcomeState.initial({
    @Default(StateStatus.pure) StateStatus status,
    @Default(true) bool isEditing,
    @Default(false) bool isValid,
    AuthenticatedUser? user,
  }) = _Initial;

  const WelcomeState._();
}
