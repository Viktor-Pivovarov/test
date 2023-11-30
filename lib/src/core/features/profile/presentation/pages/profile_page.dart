import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.onResult});

  final OnResult? onResult;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color appBarColor = Colors.transparent;
  double initialFontSize = 24;
  double fontSize = 24;

  ProfileCubit get _cubit => ProfileInjection.sl();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        initialFontSize = context.texts.headline.big.fontSize ?? 24;
        fontSize = initialFontSize;
      });
    });
  }

  void onScroll(double offset) {
    if (offset > 50) {
      if (appBarColor == context.colors.bg.secondary) {
        return;
      }

      setState(() {
        appBarColor = context.colors.bg.secondary
            .withOpacity(getDelta(offset.clamp(10, 50), from: 0.1));
        fontSize = getDelta(
          offset.clamp(10, 50),
          from: 30,
          to: 20,
        );
      });
    } else {
      setState(() {
        appBarColor = context.colors.bg.secondary
            .withOpacity(getDelta(offset.clamp(10, 50)));

        fontSize = getDelta(
          offset.clamp(10, 50),
          from: 30,
          to: 20,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: _cubit,
      builder: (context, state) {
        return UiScrollScaffold(
          padding: const EdgeInsets.only(bottom: Insets.bottomNavBar),
          stateStream: _cubit.refreshStream,
          onRefresh: _cubit.onRefresh,
          onScroll: onScroll,
          appBar: UiAppBar(
            backgroundColor: appBarColor,
            title: GestureDetector(
              onLongPress: AuthInjection.sl<AuthCubit>().onPressedSystemDialog,
              child: Text(
                state.profile.firstName ?? '',
                style: context.texts.headline.big.copyWith(
                  fontSize: fontSize,
                ),
              ),
            ),
            useColor: true,
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (!state.profile.isFillingCompleted)
                    UiProfileCompletedCard(
                      label: ProfileI18n.questionnaireCardTitle,
                      percent: state.profile.filling,
                      hint: ProfileI18n.questionnaireCardDescription,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: Insets.l),
                    child: Stack(
                      children: <Widget>[
                        UiPhotoSlider(
                          photos: state.user.profile.photos
                              .map((e) => e.image)
                              .toList(),
                          padding: const EdgeInsets.only(bottom: Insets.xxl),
                          emptyPhotosText: ProfileI18n.emptyPhoto,
                        ),
                        Positioned(
                          right: Insets.l,
                          bottom: Insets.s,
                          child: UiRoundButton(
                            icon: UiIcon(AssetsNew.icons.dsAddAPhoto.path),
                            onPressed: _cubit.onPressedPhotos,
                          ),
                        ),
                      ],
                    ),
                  ),
                  UiProfileZodiacCard(
                    onPressed: _cubit.onPressedBirthTime,
                    label: ProfileI18n.bornCardTitle(
                      state.profile.birthdayFormat ?? '',
                      state.user.vedic.birthLocation?.city ?? '',
                      state.user.vedic.birthtimeFormat ?? '',
                    ),
                    text: CoreI18n.age(state.user.searcher.age ?? 0),
                    assetZodiacIcon: Assets.zodiacsIcons.zodiac(
                      state.profile.zodiac?.name ?? ZodiacEnum.aquarius.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: Insets.l),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: Insets.m),
                          child: UiIcon(
                            Assets.icons.iOpenEye,
                            useColor: false,
                          ),
                        ),
                        Text(
                          ProfileI18n.birthdayDescription,
                          style: context.text.mainTextMedium.copyWith(
                            color: ThemeConfig.smallTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const UiDivider(
                    margin: EdgeInsets.only(top: Insets.s, bottom: Insets.l),
                  ),
                  UiProfileHintCard(
                    label: ProfileI18n.activateHintsCardTitle,
                    text: ProfileI18n.activateHintsCardDescription,
                    onPressedButton: () =>
                        print('UiProfileHintCard onPressedButton'),
                  ),
                  UiAboutMeInfoCard(
                    title: ProfileI18n.aboutMeCardTitle,
                    hasError: !state.filledBio,
                    text: !state.filledBio
                        ? ProfileI18n.bioHint
                        : state.profile.bio,
                    onPressed: _cubit.onPressedAboutMe,
                  ),
                  UiProfileQuestionnaireCard(
                    label: ProfileI18n.myProfile,
                    hasError: !state.filledQuestionary,
                    user: state.user,
                    onPressedQuestionnaire: _cubit.onPressedQuestionnaire,
                  ),
                  UiProfileInterestsCard(
                    title: ProfileI18n.myInterests,
                    hint: ProfileI18n.interestsHint,
                    hasError: !state.filledInterests,
                    items: state.profile.interests.map((e) => e.name).toList(),
                    onPressed: _cubit.onPressedMyInterests,
                  ),
                  UiProfileLanguagesCard(
                    title: ProfileI18n.languageSkills,
                    items: state.profile.languages.map((e) => e.name).toList(),
                    onPressed: _cubit.onPressedLanguages,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
