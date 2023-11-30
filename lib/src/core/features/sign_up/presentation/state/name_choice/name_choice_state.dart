part of 'name_choice_cubit.dart';

@freezed
class NameChoiceState with _$NameChoiceState {
  const factory NameChoiceState.initial({
    @Default(StateStatus.pure) StateStatus status,
    @Default('') String name,
    @Default(false) bool isWelcomeAdded,
    @Default(true) bool isEditing,
    @Default(false) bool isValid,
    AuthenticatedUser? user,
  }) = _Initial;

  const NameChoiceState._();
}
