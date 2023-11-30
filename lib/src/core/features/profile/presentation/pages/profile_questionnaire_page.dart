import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class ProfileQuestionnairePage extends StatefulWidget
    implements AutoRouteWrapper {
  const ProfileQuestionnairePage({
    @QueryParam('question') this.question,
    super.key,
  });

  final String? question;

  @override
  State<ProfileQuestionnairePage> createState() =>
      _ProfileQuestionnairePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProfileQuestionnaireCubit>(
      create: (context) => ProfileInjection.sl<ProfileQuestionnaireCubit>(),
      child: this,
    );
  }
}

class _ProfileQuestionnairePageState extends State<ProfileQuestionnairePage> {
  ProfileQuestionnaireCubit get _cubit =>
      context.read<ProfileQuestionnaireCubit>();

  ProfileCubit get _profileCubit => ProfileInjection.sl();

  late final FormControl<int> educationFormControl;
  late final FormControl<int> professionalStatusesFormControl;
  late final FormControl<int> spheresFormControl;
  late final FormControl<int> religionFormControl;
  late final FormControl<int> familyPlanFormControl;
  late final FormControl<int> covidFormControl;
  late final FormControl<int> smokeStatusFormControl;
  late final FormControl<int> alcoholStatusFormControl;
  late final FormControl<int> foodPreferenceFormControl;
  late final FormControl<int> workoutFormControl;
  late final FormControl<int> sleepHabitFormControl;
  late final FormControl<bool> noPetsFormControl;

  final FormArray<bool> petsFormControl = FormArray<bool>([]);
  final FormArray<bool> idealMeetingPointsFormControl = FormArray<bool>([]);

  late final AnchorScrollController _scrollController;
  late final PageController _pageController;
  late AuthenticatedUser _user;

  int index = 0;

  final Map<int, String> _images = {
    0: Assets.images.artHeight,
    1: Assets.images.artEducation,
    2: Assets.images.artProfessional,
    3: Assets.images.artSphere,
    4: Assets.images.artReligion,
    5: Assets.images.artFamilyPlan,
    6: Assets.images.artCovid,
    7: Assets.images.artSmoke,
    8: Assets.images.artAlcohol,
    9: Assets.images.artFoodPreference,
    10: Assets.images.artWorkout,
    11: Assets.images.artSleepHabit,
    12: Assets.images.artPets,
    13: Assets.images.artIdealMeetingPoints,
  };

  final Map<QuestionnaireEnum, String> _icons = {
    QuestionnaireEnum.height: Assets.icons.ruler1,
    QuestionnaireEnum.education: Assets.icons.student1,
    QuestionnaireEnum.professionalStatus: Assets.icons.coffeeCup1,
    QuestionnaireEnum.sphere: Assets.icons.work,
    QuestionnaireEnum.religion: Assets.icons.pray1,
    QuestionnaireEnum.familyPlan: Assets.icons.baby1,
    QuestionnaireEnum.covid: Assets.icons.covidLine,
    QuestionnaireEnum.smokeStatus: Assets.icons.smoke1,
    QuestionnaireEnum.alcoholStatus: Assets.icons.wineBar,
    QuestionnaireEnum.foodPreference: Assets.icons.mdiFoodOutline,
    QuestionnaireEnum.workout: Assets.icons.sports,
    QuestionnaireEnum.sleepHabit: Assets.icons.partlyCloudy,
    QuestionnaireEnum.pets: Assets.icons.lucideDog,
    QuestionnaireEnum.idealMeetingPoints: Assets.icons.iHeart,
  };

  @override
  void initState() {
    super.initState();

    // updateData();

    index = QuestionnaireEnum.values
        .indexWhere((element) => element.name == widget.question);

    _scrollController = AnchorScrollController();

    _pageController = PageController(initialPage: index);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollTo(index);
    });
  }

  void updateData() {
    _user = _cubit.state.user;

    educationFormControl = FormControl(value: _user.profile.education?.id);

    professionalStatusesFormControl =
        FormControl(value: _user.profile.professionalStatus?.id);

    spheresFormControl = FormControl(value: _user.profile.sphere?.id);

    religionFormControl = FormControl(value: _user.profile.religion?.id);

    familyPlanFormControl = FormControl(value: _user.profile.familyPlan?.id);

    covidFormControl = FormControl(value: _user.profile.covid?.id);
    smokeStatusFormControl = FormControl(value: _user.profile.smokeStatus?.id);
    alcoholStatusFormControl =
        FormControl(value: _user.profile.alcoholStatus?.id);
    foodPreferenceFormControl =
        FormControl(value: _user.profile.foodPreference?.id);
    workoutFormControl = FormControl(value: _user.profile.workout?.id);
    sleepHabitFormControl = FormControl(value: _user.profile.sleepHabit?.id);
    noPetsFormControl = FormControl(value: _user.profile.pets.isEmpty);

    petsFormControl.clear();

    for (final element in _cubit.state.pets) {
      petsFormControl
          .add(FormControl<bool>(value: _user.profile.pets.contains(element)));
    }

    idealMeetingPointsFormControl.clear();

    for (final element in _cubit.state.idealMeetingPoints) {
      idealMeetingPointsFormControl.add(
        FormControl<bool>(
          value: _user.profile.idealMeetingPoints.contains(element),
        ),
      );
    }
  }

  void _onPressedTag(int newIndex) {
    setState(() {
      index = newIndex;
    });

    _scrollTo(index);
  }

  void _scrollTo(int index) {
    _pageController.jumpToPage(index);

    _scrollController.scrollToIndex(
      index: index,
      scrollSpeed: 10,
    );
  }

  void _onPressedSkip() {
    if (index == QuestionnaireEnum.values.length - 1) {
      final String currentRoute = context.router.currentSegments.last.name;

      final String? nextRoute =
          _profileCubit.state.getNextFillPage(currentRoute);

      if (nextRoute == null) {
        context.router.pop();
      } else {
        context.router.replaceNamed(nextRoute);
      }
    } else {
      _onPressedTag(index + 1);
    }
  }

  Future<void> _onPressedConfirm() async {
    switch (index) {
      case 0:
        await _cubit.onPressedSaveHeight(_user.searcher.height!);
      case 1:
        if (educationFormControl.value != null) {
          await _cubit.onPressedSaveEducation(educationFormControl.value!);
        }
      case 2:
        if (professionalStatusesFormControl.value != null) {
          await _cubit.onPressedSaveProfessionalStatus(
            professionalStatusesFormControl.value!,
          );
        }
      case 3:
        if (spheresFormControl.value != null) {
          await _cubit.onPressedSaveSphere(spheresFormControl.value!);
        }
      case 4:
        if (religionFormControl.value != null) {
          await _cubit.onPressedSaveReligion(religionFormControl.value!);
        }
      case 5:
        if (familyPlanFormControl.value != null) {
          await _cubit.onPressedSaveFamilyPlan(familyPlanFormControl.value!);
        }
      case 6:
        if (covidFormControl.value != null) {
          await _cubit.onPressedSaveCovid(covidFormControl.value!);
        }
      case 7:
        if (smokeStatusFormControl.value != null) {
          await _cubit.onPressedSaveSmokeStatus(smokeStatusFormControl.value!);
        }
      case 8:
        if (alcoholStatusFormControl.value != null) {
          await _cubit
              .onPressedSaveAlcoholStatus(alcoholStatusFormControl.value!);
        }
      case 9:
        if (foodPreferenceFormControl.value != null) {
          await _cubit
              .onPressedSaveFoodPreference(foodPreferenceFormControl.value!);
        }
      case 10:
        if (workoutFormControl.value != null) {
          await _cubit.onPressedSaveWorkout(workoutFormControl.value!);
        }
      case 11:
        if (sleepHabitFormControl.value != null) {
          await _cubit.onPressedSaveSleepHabit(sleepHabitFormControl.value!);
        }
      case 12:
        final selected =
            petsFormControl.controls.any((element) => element.value ?? false);
        if (selected) {
          final result = <int>[];

          petsFormControl.value?.forEachIndexed((index, element) {
            if (element ?? false) {
              result.add(_cubit.state.pets.elementAt(index).id);
            }
          });

          await _cubit.onPressedSavePets(result);
        } else {
          await _cubit.onPressedSavePets([]);
        }
      case 13:
        final result = <int>[];

        idealMeetingPointsFormControl.value?.forEachIndexed((index, element) {
          if (element ?? false) {
            result.add(_cubit.state.idealMeetingPoints.elementAt(index).id);
          }
        });

        await _cubit.onPressedSaveIdealMeeting(result);

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = context.mediaSize.width;

    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileQuestionnaireCubit, ProfileQuestionnaireState>(
          listenWhen: (previous, current) {
            return previous.status.isPure && current.status.isFetchingSuccess;
          },
          listener: (context, state) {
            updateData();
          },
        ),
        BlocListener<ProfileQuestionnaireCubit, ProfileQuestionnaireState>(
          listenWhen: (previous, current) {
            if (previous.user != current.user) {
              setState(() {
                _user = current.user.copyWith();
              });
            }

            return previous.status.isFetchingInProgress &&
                current.status.isFetchingSuccess;
          },
          listener: (context, state) {
            _onPressedSkip();
          },
        ),
        // BlocConsumer<ProfileQuestionnaireCubit, ProfileQuestionnaireState>(
        //   bloc: _cubit,

        //   builder: (context, state) {

        //   },
        // );
      ],
      child: BlocBuilder<ProfileQuestionnaireCubit, ProfileQuestionnaireState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.color.fillBgColor,
            appBar: UiAppBar(
              title: Text(
                ProfileI18n.questionnaire,
                style: context.text.mainTitle,
              ),
              actions: [
                if (index < QuestionnaireEnum.values.length)
                  UiButton.action(
                    text: CoreI18n.skip,
                    onPressed: _onPressedSkip,
                    textStyle: context.text.mainTextMedium
                        .copyWith(color: context.color.textColor),
                  ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: ListView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    children: QuestionnaireEnum.values.map((e) {
                      return AnchorItemWrapper(
                        index: QuestionnaireEnum.values.indexOf(e),
                        controller: _scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: GestureDetector(
                            onTap: () => _onPressedTag(
                              QuestionnaireEnum.values.indexOf(e),
                            ),
                            child: Chip(
                              side: BorderSide(
                                color:
                                    index == QuestionnaireEnum.values.indexOf(e)
                                        ? context.color.textColor
                                        : context.color.smallTextColor,
                              ),
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.all(
                                Insets.s,
                              ),
                              label: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: Insets.s),
                                    child: UiIcon(
                                      _icons[e] ?? Assets.icons.ruler1,
                                      width: 20,
                                      height: 20,
                                      color: index ==
                                              QuestionnaireEnum.values
                                                  .indexOf(e)
                                          ? context.color.textColor
                                          : context.color.smallTextColor,
                                    ),
                                  ),
                                  Text(
                                    ProfileI18n.questionnaireTitle(e),
                                    style: context.text.mainTextMedium.copyWith(
                                      color: index ==
                                              QuestionnaireEnum.values
                                                  .indexOf(e)
                                          ? context.color.textColor
                                          : context.color.smallTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: QuestionnaireEnum.values.map((e) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            UiImage(_images[index]!, width: width / 1.2),
                            _buildWidget(state),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: UiBottomSheet(
              child: UiButton(
                text: CoreI18n.confirm,
                onPressed: _onPressedConfirm,
                disabled: state.status.isFetchingInProgress,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWidget(ProfileQuestionnaireState state) {
    switch (index) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 55,
            ),
            UiNumberSlider(
              from: 50,
              to: 250,
              value: _user.searcher.height!,
              onSelectedItemChanged: (int value) {
                setState(() {
                  _user = _user.copyWith(
                    searcher: _user.searcher.copyWith(height: value),
                  );
                });
              },
              label: 'centimeters',
            ),
          ],
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.educations.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: educationFormControl,
                );
              }),
            ],
          ),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.professionalStatuses.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: professionalStatusesFormControl,
                );
              }),
            ],
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.spheres.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: spheresFormControl,
                );
              }),
            ],
          ),
        );
      case 4:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.religions.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: religionFormControl,
                );
              }),
            ],
          ),
        );
      case 5:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.familyPlans.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: familyPlanFormControl,
                );
              }),
            ],
          ),
        );
      case 6:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.covid.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: covidFormControl,
                );
              }),
            ],
          ),
        );
      case 7:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.smokeStatuses.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: smokeStatusFormControl,
                );
              }),
            ],
          ),
        );
      case 8:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.alcoholStatuses.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: alcoholStatusFormControl,
                );
              }),
            ],
          ),
        );
      case 9:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.foodPreferences.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: foodPreferenceFormControl,
                );
              }),
            ],
          ),
        );
      case 10:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.workouts.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: workoutFormControl,
                );
              }),
            ],
          ),
        );
      case 11:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.sleepHabits.map((e) {
                return UiRadioField<int>(
                  label: e.name,
                  value: e.id,
                  formControl: sleepHabitFormControl,
                );
              }),
            ],
          ),
        );
      case 12:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: Insets.l),
                child: Text(
                  ProfileI18n.multiSelectTitle,
                  style: context.text.smallText
                      .copyWith(color: context.color.smallTextColor),
                ),
              ),
              ...petsFormControl.controls.mapIndexed((i, control) {
                if (i == 0) {
                  return UiRadioField<bool>(
                    label: ProfileI18n.noPets,
                    padding: const EdgeInsets.only(bottom: Insets.s),
                    value: true,
                    formControl: control as FormControl<bool>,
                    onChanged: (value) {
                      control.value = value ?? false;

                      for (final element in petsFormControl.controls.skip(1)) {
                        element.value = false;
                      }
                    },
                  );
                }

                return UiCheckboxField(
                  formControl: control as FormControl<bool>,
                  label: state.pets[i].name,
                  onChanged: (value) {
                    control.value = !(value ?? true);

                    final selected = petsFormControl.controls
                        .any((element) => element.value ?? false);

                    petsFormControl.controls.first.value = !selected;
                  },
                );
              }),
            ],
          ),
        );
      case 13:
        return Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: Insets.l),
                child: Text(
                  ProfileI18n.multiSelectTitle,
                  style: context.text.smallText
                      .copyWith(color: context.color.smallTextColor),
                ),
              ),
              ...idealMeetingPointsFormControl.controls
                  .mapIndexed((i, control) {
                return UiCheckboxField(
                  formControl: control as FormControl<bool>,
                  label: state.idealMeetingPoints[i].name,
                );
              }),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
