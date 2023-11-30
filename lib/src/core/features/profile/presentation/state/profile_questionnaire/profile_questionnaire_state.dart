part of 'profile_questionnaire_cubit.dart';

@freezed
class ProfileQuestionnaireState with _$ProfileQuestionnaireState {
  const factory ProfileQuestionnaireState({
    required AuthenticatedUser user,
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    @Default(<DictModel>[]) List<DictModel> alcoholStatuses,
    @Default(<DictModel>[]) List<DictModel> educations,
    @Default(<DictModel>[]) List<DictModel> familyPlans,
    @Default(<DictModel>[]) List<DictModel> foodPreferences,
    @Default(<DictModel>[]) List<DictModel> idealMeetingPoints,
    @Default(<DictModel>[]) List<DictModel> languages,
    @Default(<DictModel>[]) List<DictModel> pets,
    @Default(<DictModel>[]) List<DictModel> professionalStatuses,
    @Default(<DictModel>[]) List<DictModel> religions,
    @Default(<DictModel>[]) List<DictModel> sleepHabits,
    @Default(<DictModel>[]) List<DictModel> smokeStatuses,
    @Default(<DictModel>[]) List<DictModel> spheres,
    @Default(<DictModel>[]) List<DictModel> workouts,
    @Default(<DictModel>[]) List<DictModel> covid,
  }) = _Initial;
}
