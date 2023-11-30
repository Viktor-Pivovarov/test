import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'languages_cubit.freezed.dart';

part 'languages_state.dart';

class LanguagesStepCubit extends Cubit<LanguagesStepState>
    implements AbstractRegisterStep {
  LanguagesStepCubit(
      {required SignUpRepository repository,
      required GetUserCase getUserCase,
      required DictRepository dictRepository,
      required NotifyService notifyService,
      required AppSettingsCubit appSettingsCubit,})
      : _repository = repository,
        _getUserCase = getUserCase,
        _dictRepository = dictRepository,
        _notifyService = notifyService,
        _appSettingsCubit = appSettingsCubit,
        super(const LanguagesStepState.initial());

  final AppSettingsCubit _appSettingsCubit;

  static StepEnum id = StepEnum.languages;

  final DictRepository _dictRepository;

  final SignUpRepository _repository;

  final GetUserCase _getUserCase;

  final NotifyService _notifyService;

  FormArray<bool> controls = FormArray<bool>([]);

  late void Function([AuthenticatedUser? data, StepEnum? id]) _onFinish;

  StreamSubscription<AuthenticatedUser>? _stream;

  Future<void> _save() async {
    final result = await _repository.setLanguages(getCurrentLanguagesIds());

    result.fold((error) {
      _notifyService.showError(error.message ?? '');
    }, (r) {
      final user = state.user;

      emit(state.copyWith(isEditing: false));

      if (user?.profile != null) {
        _onFinish(
          user?.copyWith(
            profile: user.profile.copyWith(languages: state.selectedLanguages),
          ),
          id,
        );
      }
    });
  }

  void onChanged(List<DictModel> value) {
    emit(state.copyWith(showLanguages: value));
  }

  Future<void> openDialog(BuildContext context) async {
    final List<int>? result = await LanguagesDialog.showDialog(
      context,
      getCurrentLanguagesIds().join(','),
    );

    if (result != null) {
      final sortedLanguages = [
        for (final int id in result)
          state.languages.firstWhere((item) => item.id == id),
      ];

      emit(
        state.copyWith(
          selectedLanguages: result
              .map(
                (e) => state.languages.firstWhere((element) => e == element.id),
              )
              .toList(),
          showLanguages: [
            ...sortedLanguages,
            ...state.languages.whereNot((e) => result.contains(e.id)),
          ].take(maxNumberWidgets(result.length)).toList(),
        ),
      );

      fillControls();
    }
  }

  void fillControls() {
    controls.clear();

    for (final element in state.showLanguages) {
      controls.add(
        FormControl<bool>(
          value: state.selectedLanguages.contains(element),
        ),
      );
    }
  }

  @override
  List<StepWidget> children() => <StepWidget>[
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.aboutLanguagesMessage,
          ),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<LanguagesStepCubit, LanguagesStepState>(
            bloc: this,
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  if (state.isEditing) ...[
                    UiCard(
                      child: Column(
                        children: [
                          ...controls.controls.mapIndexed((i, control) {
                            final bool isSystemLanguage =
                                _appSettingsCubit.state.deviceLocaleCode ==
                                    state.showLanguages[i].code;
                            return UiCheckboxField(
                              formControl: control as FormControl<bool>,
                              label: state.showLanguages[i].name,
                              description: isSystemLanguage
                                  ? LanguagesI18n.systemLanguage
                                  : null,
                              onChanged: (value) {
                                final currentValue = state.showLanguages[i];
                                final Set<DictModel> convertedLanguages =
                                    state.selectedLanguages.toSet();

                                if (value == null || value == false) {
                                  convertedLanguages.add(currentValue);
                                } else {
                                  convertedLanguages.remove(currentValue);
                                }

                                emit(
                                  state.copyWith(
                                    selectedLanguages:
                                        convertedLanguages.toList(),
                                  ),
                                );

                                fillControls();
                              },
                              readOnly: isSystemLanguage,
                            );
                          }),
                          UiButton.text(
                            text: SignUpI18n.showLanguagesBtn,
                            onPressed: () => openDialog(context),
                          ),
                        ],
                      ),
                    ),
                    UiButton(
                      disabled: state.selectedLanguages.isEmpty,
                      text: SignUpI18n.confirmBtn,
                      suffixIcon: UiIcon(Assets.icons.iCheck),
                      onPressed: _save,
                    ),
                  ] else ...[
                    UiAnswerMessage(
                      title: SignUpI18n.languagesEditModeMessage,
                      content: state.selectedLanguages
                          .map((item) => item.name)
                          .join(' ')
                          .replaceAll(' ', '\n'),
                      onPressed: () {
                        emit(
                          state.copyWith(isEditing: true),
                        );
                      },
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ];

  List<int> getCurrentLanguagesIds() {
    final result = <int>[];

    controls.value?.forEachIndexed((index, element) {
      if (element ?? false) {
        result.add(state.showLanguages.elementAt(index).id);
      }
    });

    return result;
  }

  int maxNumberWidgets(int value) {
    return value > 5 ? value : 5;
  }

  @override
  Future<void> init(
    StepEnum? initStep,
    void Function(
      List<StepWidget>? children, {
      bool useDuration,
    }) addChildren,
    void Function([AuthenticatedUser? data, StepEnum? id]) onFinish,
  ) async {
    _onFinish = onFinish;

    final result = await _getUserCase(NoParams());
    final resultLanguages = await _dictRepository.getLanguages();

    resultLanguages.fold(
      (e) => print,
      (allLanguages) {
        emit(state.copyWith(languages: allLanguages));

        _stream = result.listen(
          (user) async {
            if (state.status.isPure) {
              final value = user.profile.languages;
              final isInitValue = value.isEmpty;

              addChildren(
                children(),
                useDuration: isInitValue,
              );

              if (!isInitValue) {
                onChanged(value);
                if (initStep != id) {
                  onFinish();
                }
              }

              //TODO-Pavlov вынести в общие функции для языков
              final systemDefaultLanguage = allLanguages.where(
                (element) =>
                    element.code == _appSettingsCubit.state.deviceLocaleCode!,
              );

              final Iterable<DictModel> showLanguages = [
                ...value.isNotEmpty ? value : systemDefaultLanguage,
                ...allLanguages.whereNot(value.contains),
              ];

              late final List<DictModel> selectedLanguages =
                  (value.isNotEmpty ? value : systemDefaultLanguage).toList();

              emit(
                state.copyWith(
                  user: user,
                  isEditing: isInitValue || initStep == id,
                  status: StateStatus.fetchingSuccess,
                  selectedLanguages: selectedLanguages,
                  showLanguages: showLanguages
                      .take(
                        maxNumberWidgets(value.length),
                      )
                      .toList(),
                ),
              );

              fillControls();
            }
          },
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _stream?.cancel();
    await super.close();
  }
}
