import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiProfileQuestionnaireCard extends StatelessWidget {
  const UiProfileQuestionnaireCard({
    required this.label,
    required this.user,
    required this.onPressedQuestionnaire,
    super.key,
    this.hasError = false,
  });

  final AuthenticatedUser user;
  final String label;
  final bool hasError;

  final void Function(QuestionnaireEnum value) onPressedQuestionnaire;

  @override
  Widget build(BuildContext context) {
    return UiProfileCard(
      label: label,
      hasError: hasError,
      items: [
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.height,
          ),
          description: ProfileI18n.heightValue(
            user.searcher.height ?? 0,
          ),
          iconAsset: Assets.icons.ruler1,
          onPressed: () => onPressedQuestionnaire(QuestionnaireEnum.height),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.education,
          ),
          description: user.profile.education?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.education != null,
          iconAsset: Assets.icons.student1,
          onPressed: () => onPressedQuestionnaire(
            QuestionnaireEnum.education,
          ),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.professionalStatus,
          ),
          description:
              user.profile.professionalStatus?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.professionalStatus != null,
          iconAsset: Assets.icons.coffeeCup1,
          onPressed: () => onPressedQuestionnaire(
            QuestionnaireEnum.professionalStatus,
          ),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.sphere,
          ),
          description: user.profile.sphere?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.sphere != null,
          iconAsset: Assets.icons.work,
          onPressed: () => onPressedQuestionnaire(QuestionnaireEnum.sphere),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.religion,
          ),
          description: user.profile.religion?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.religion != null,
          iconAsset: Assets.icons.pray1,
          onPressed: () => onPressedQuestionnaire(QuestionnaireEnum.religion),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.familyPlan,
          ),
          description: user.profile.familyPlan?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.familyPlan != null,
          iconAsset: Assets.icons.baby1,
          onPressed: () => onPressedQuestionnaire(
            QuestionnaireEnum.familyPlan,
          ),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.covid,
          ),
          description: user.profile.covid?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.covid != null,
          iconAsset: Assets.icons.covidLine,
          onPressed: () => onPressedQuestionnaire(QuestionnaireEnum.covid),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.smokeStatus,
          ),
          description: user.profile.smokeStatus?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.smokeStatus != null,
          iconAsset: Assets.icons.smoke1,
          onPressed: () => onPressedQuestionnaire(
            QuestionnaireEnum.smokeStatus,
          ),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.alcoholStatus,
          ),
          description:
              user.profile.alcoholStatus?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.alcoholStatus != null,
          iconAsset: Assets.icons.wineBar,
          onPressed: () => onPressedQuestionnaire(
            QuestionnaireEnum.alcoholStatus,
          ),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.foodPreference,
          ),
          description:
              user.profile.foodPreference?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.foodPreference != null,
          iconAsset: Assets.icons.mdiFoodOutline,
          onPressed: () => onPressedQuestionnaire(
            QuestionnaireEnum.foodPreference,
          ),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.workout,
          ),
          description: user.profile.workout?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.workout != null,
          iconAsset: Assets.icons.sports,
          onPressed: () => onPressedQuestionnaire(QuestionnaireEnum.workout),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.sleepHabit,
          ),
          description: user.profile.sleepHabit?.name ?? ProfileI18n.addAnswer,
          valid: user.profile.sleepHabit != null,
          iconAsset: Assets.icons.partlyCloudy,
          onPressed: () => onPressedQuestionnaire(
            QuestionnaireEnum.sleepHabit,
          ),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.pets,
          ),
          description: user.profile.petsValue ?? ProfileI18n.addAnswer,
          valid: user.profile.petsValue != null,
          iconAsset: Assets.icons.lucideDog,
          onPressed: () => onPressedQuestionnaire(QuestionnaireEnum.pets),
        ),
        ProfileCardItem(
          title: ProfileI18n.questionnaireTitle(
            QuestionnaireEnum.idealMeetingPoints,
          ),
          description:
              user.profile.idealMeetingPointsValue ?? ProfileI18n.addAnswer,
          valid: user.profile.idealMeetingPointsValue != null,
          iconAsset: Assets.icons.iHeart,
          onPressed: () => onPressedQuestionnaire(
            QuestionnaireEnum.idealMeetingPoints,
          ),
        ),
      ],
    );
  }
}
