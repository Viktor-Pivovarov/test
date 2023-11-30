part of 'languages_cubit.dart';

@freezed
class LanguagesStepState with _$LanguagesStepState {
  const factory LanguagesStepState.initial({
    @Default(StateStatus.pure) StateStatus status,
    @Default(true) bool isEditing,
    @Default(false) bool isValid,
    @Default([]) List<DictModel> selectedLanguages,
    @Default([]) List<DictModel> showLanguages,
    @Default([]) List<DictModel> languages,
    AuthenticatedUser? user,
  }) = _Initial;

  const LanguagesStepState._();
}
