part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required AuthenticatedUser user,
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    @Default(<DictModel>[]) List<DictModel> languages,
    @Default(<InterestModel>[]) List<InterestModel> interests,
  }) = _Initial;

  const ProfileState._();

  ProfileModel get profile => user.profile;

  List<String> get profileLargePhotos => [];

  bool get filledInterests => profile.interests.isNotEmpty;
  bool get filledBio => profile.bio.isNotEmpty;
  bool get filledQuestionary =>
      questionaryItems.entries.every((element) => element.value);

  Map<QuestionnaireEnum, bool> get questionaryItems => {
        QuestionnaireEnum.height: user.searcher.height != 0,
        QuestionnaireEnum.education: profile.education != null,
        QuestionnaireEnum.professionalStatus:
            profile.professionalStatus != null,
        QuestionnaireEnum.sphere: profile.sphere != null,
        QuestionnaireEnum.religion: profile.religion != null,
        QuestionnaireEnum.familyPlan: profile.familyPlan != null,
        QuestionnaireEnum.covid: profile.covid != null,
        QuestionnaireEnum.smokeStatus: profile.smokeStatus != null,
        QuestionnaireEnum.alcoholStatus: profile.alcoholStatus != null,
        QuestionnaireEnum.foodPreference: profile.foodPreference != null,
        QuestionnaireEnum.workout: profile.workout != null,
        QuestionnaireEnum.sleepHabit: profile.sleepHabit != null,
        QuestionnaireEnum.pets: profile.pets.isNotEmpty,
        QuestionnaireEnum.idealMeetingPoints:
            profile.idealMeetingPoints.isNotEmpty,
      };

  String? getNextFillPage(String current) {
    switch (current) {
      case 'ProfileAboutMeRoute':
        if (!filledInterests) {
          return ProfileRoutePath.interests;
        }

        if (!filledQuestionary) {
          return ProfileRoutePath.questionnaire.query({
            'question': questionaryItems.entries
                .lastWhereOrNull((element) => element.value)
                ?.key
                .name,
          });
        }
      case 'ProfileInterestsRoute':
        if (!filledBio) {
          return ProfileRoutePath.aboutMe;
        }

        if (!filledQuestionary) {
          return ProfileRoutePath.questionnaire.query({
            'question': questionaryItems.entries
                .lastWhereOrNull((element) => element.value)
                ?.key
                .name,
          });
        }
      case 'ProfileQuestionnaireRoute':
        if (!filledInterests) {
          return ProfileRoutePath.interests;
        }

        if (!filledBio) {
          return ProfileRoutePath.aboutMe;
        }
    }

    return null;
  }

  bool get hasError => !filledInterests || !filledBio || !filledQuestionary;
}
