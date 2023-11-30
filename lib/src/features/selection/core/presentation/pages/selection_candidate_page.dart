import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class SelectionCandidatePage extends StatelessWidget
    implements AutoRouteWrapper {
  const SelectionCandidatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferCubit, OfferState>(
      listenWhen: (previous, current) {
        return current.status.isFinish;
      },
      listener: (context, state) {
        context.popRoute();
      },
      builder: (context, state) {
        final String? name = state.offer?.candidate.name;

        return Scaffold(
          appBar: UiAppBar(
            leading: BackButton(onPressed: context.router.parent()?.pop),
            title: name != null
                ? Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: Insets.s),
                          child: Text(
                            name,
                            style: context.text.bigTitle,
                          ),
                        ),
                      ),
                      UiIcon(
                        Assets.icons.iParkSolidProtect,
                        useColor: false,
                      ),
                      const SizedBox(width: Insets.l),
                    ],
                  )
                : null,
          ),
          body: Builder(
            builder: (context) {
              if (state.offer == null) {
                return Padding(
                  padding: const EdgeInsets.all(Insets.l),
                  child: SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      borderRadius: BorderRadius.circular(Insets.m),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height -
                          (Insets.bottomNavBar * 2) -
                          Insets.l,
                    ),
                  ),
                );
              }

              final OfferEntity offer = state.offer!;
              final CandidateEntity candidate = offer.candidate;

              return ListView(
                padding: Insets.defaultPageInsetsWithBottomBar,
                children: [
                  UiCard(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            UiPhotoSlider(
                              onPressedPhoto:
                                  context.read<OfferCubit>().onPressedPhoto,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(BorderRadiusInsets.l),
                                topRight: Radius.circular(BorderRadiusInsets.l),
                              ),
                              photos: candidate.photos,
                              padding: EdgeInsets.zero,
                              bottomContent: Padding(
                                padding: const EdgeInsets.only(top: Insets.s),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    if (offer.noAnswerDatingState)
                                      UiIconButton(
                                        Assets.icons.iCross,
                                        onPressed: state
                                                .status.isFetchingInProgress
                                            ? null
                                            : () async {
                                                await context
                                                    .read<OfferCubit>()
                                                    .onPressedDecline(offer.id);

                                                await context.popRoute();
                                              },
                                      ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: Insets.xs,
                                          ),
                                          child: UiIcon(
                                            Assets.icons.iMap,
                                            width: Insets.m,
                                            color: context.color.fillBgColor,
                                          ),
                                        ),
                                        Text(
                                          SelectionI18n.distance(
                                            offer.distance,
                                          ).toUpperCase(),
                                          style:
                                              context.text.smallText.copyWith(
                                            color: context.color.fillBgColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (offer.noAnswerDatingState)
                                      UiIconButton(
                                        Assets.icons.iHeart,
                                        color: context.color.green,
                                        onPressed:
                                            state.status.isFetchingInProgress
                                                ? null
                                                : () => context
                                                    .read<OfferCubit>()
                                                    .onPressedAccept(offer.id),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: Insets.l,
                              top: Insets.l,
                              child: UiOfferStatus(
                                status: state.offer?.datingState,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  UiProfileZodiacCard(
                    text: CoreI18n.age(candidate.age),
                    astrologyText: CoreI18n.zodiac(
                      candidate.zodiac,
                    ),
                    assetZodiacIcon: Assets.zodiacsIcons.zodiac(
                      candidate.zodiac.name,
                    ),
                  ),
                  UiAstrologicalCompatibilityCard(
                    title: SelectionI18n.astrologicalCompatibility,
                    count: offer.compatibility.value.toInt(),
                    maxCount: offer.compatibility.maxValue.toInt(),
                    onPressed: context
                        .read<OfferCubit>()
                        .onPressedAstrologicalCompatibility,
                  ),
                  if (candidate.bio != null)
                    UiAboutMeCard(
                      title: SelectionI18n.aboutCandidate,
                      text: candidate.bio ?? '',
                    ),
                  UiCandidateProfile(
                    title: SelectionI18n.candidateProfile,
                    items: [
                      UiCandidateProfileModel(
                        icon: Assets.icons.ruler1,
                        text: SelectionI18n.heightValue(
                          candidate.height,
                        ),
                      ),
                      if (candidate.education != null)
                        UiCandidateProfileModel(
                          text: candidate.education!.name,
                          icon: Assets.icons.student1,
                        ),
                      if (candidate.professionalStatus != null)
                        UiCandidateProfileModel(
                          text: candidate.professionalStatus!.name,
                          icon: Assets.icons.coffeeCup1,
                        ),
                      if (candidate.sphere != null)
                        UiCandidateProfileModel(
                          text: candidate.sphere!.name,
                          icon: Assets.icons.work,
                        ),
                      if (candidate.religion != null)
                        UiCandidateProfileModel(
                          text: candidate.religion!.name,
                          icon: Assets.icons.pray1,
                        ),
                      if (candidate.familyPlan != null)
                        UiCandidateProfileModel(
                          text: candidate.familyPlan!.name,
                          icon: Assets.icons.baby1,
                        ),
                      if (candidate.covid != null)
                        UiCandidateProfileModel(
                          text: candidate.covid!.name,
                          icon: Assets.icons.covidLine,
                        ),
                      if (candidate.smokeStatus != null)
                        UiCandidateProfileModel(
                          text: candidate.smokeStatus!.name,
                          icon: Assets.icons.smoke1,
                        ),
                      if (candidate.alcoholStatus != null)
                        UiCandidateProfileModel(
                          text: candidate.alcoholStatus!.name,
                          icon: Assets.icons.wineBar,
                        ),
                      if (candidate.foodPreference != null)
                        UiCandidateProfileModel(
                          text: candidate.foodPreference!.name,
                          icon: Assets.icons.mdiFoodOutline,
                        ),
                      if (candidate.workout != null)
                        UiCandidateProfileModel(
                          text: candidate.workout!.name,
                          icon: Assets.icons.sports,
                        ),
                      if (candidate.sleepHabit != null)
                        UiCandidateProfileModel(
                          text: candidate.sleepHabit!.name,
                          icon: Assets.icons.partlyCloudy,
                        ),
                      if (candidate.pets.isNotEmpty)
                        UiCandidateProfileModel(
                          text: candidate.pets.length > 1
                              ? SelectionI18n.moreThanOne
                              : candidate.pets.first.name,
                          icon: Assets.icons.lucideDog,
                        ),
                      if (candidate.idealMeetingPoints.isNotEmpty)
                        UiCandidateProfileModel(
                          text: candidate.idealMeetingPoints.length > 1
                              ? SelectionI18n.moreThanOne
                              : candidate.idealMeetingPoints.first.name,
                          icon: Assets.icons.iHeart,
                        ),
                    ],
                  ),
                  UiProfileInterestsCard(
                    title: SelectionI18n.interests,
                    items: candidate.interests.map((e) => e.name).toList(),
                    showBottomImage: false,
                  ),
                  UiProfileLanguagesCard(
                    title: SelectionI18n.languageSkills,
                    items: candidate.languages.map((e) => e.name).toList(),
                  ),
                  const UiDivider(),
                  if (offer.noAnswerDatingState)
                    UiButton(
                      text: SelectionI18n.wantToMeet,
                      primaryColor: context.color.green,
                      suffixIcon: UiIcon(Assets.icons.iHeart),
                      disabled: state.status.isFetchingInProgress,
                      onPressed: () =>
                          context.read<OfferCubit>().onPressedAccept(offer.id),
                    ),
                  if (offer.noAnswerDatingState)
                    UiButton.outline(
                      text: SelectionI18n.decline,
                      suffixIcon: UiIcon(Assets.icons.iCross),
                      disabled: state.status.isFetchingInProgress,
                      onPressed: () async {
                        await context
                            .read<OfferCubit>()
                            .onPressedDecline(offer.id);

                        await context.popRoute();
                      },
                    ),
                  UiCardTextButton(
                    text: CoreI18n.block,
                    hint: CoreI18n.addToBlackList,
                    onPressed: state.status.isFetchingInProgress
                        ? null
                        : context.read<OfferCubit>().onPressedBlock,
                    icon: UiIcon(
                      Assets.icons.bxLock,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  UiCardTextButton(
                    text: CoreI18n.complainAndBlock,
                    hint: CoreI18n.candidateBreakingRules,
                    onPressed: state.status.isFetchingInProgress
                        ? null
                        : context.read<OfferCubit>().onPressedComplainAndBlock,
                    color: context.color.mainAccentColor,
                    useDivider: false,
                    icon: UiIcon(
                      Assets.icons.iconsFlag,
                      width: 20,
                      height: 20,
                      color: context.color.mainAccentColor,
                    ),
                  ),
                  const SizedBox(height: Insets.l),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
    // BlocProvider(
    //   create: (context) =>
    //       SelectionInjection.sl<OfferCubit>()..init(int.parse(id)),
    //   child: this,
    // );
  }
}
