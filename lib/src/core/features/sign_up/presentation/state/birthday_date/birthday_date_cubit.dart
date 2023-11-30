import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'birthday_date_cubit.freezed.dart';

part 'birthday_date_state.dart';

class BirthdayDateCubit extends Cubit<BirthdayDateState>
    implements AbstractRegisterStep {
  BirthdayDateCubit({
    required SignUpRepository repository,
    required GetUserCase getUserCase,
    required NotifyService notifyService,
  })  : _repository = repository,
        _getUserCase = getUserCase,
        _notifyService = notifyService,
        super(BirthdayDateState.initial(date: DateTime.parse('1985-01-01')));

  static StepEnum id = StepEnum.birthday;

  final SignUpRepository _repository;

  final FormControl<String> formControl = FormControl<String>(
    validators: <Validator<dynamic>>[Validators.required],
  );

  final GetUserCase _getUserCase;

  final NotifyService _notifyService;

  late void Function([AuthenticatedUser? data, StepEnum? id]) _onFinish;

  StreamSubscription<AuthenticatedUser>? _stream;

  Future<void> _save() async {
    final birthday = state.date.toString();
    final user = state.user;

    final result = await _repository.setBirthday(birthday);
    result.fold((error) {
      _notifyService.showError(error.message ?? '');
    }, (r) {
      emit(
        state.copyWith(isEditing: false),
      );

      if (user?.profile != null) {
        _onFinish(
          user?.copyWith(
            profile: user.profile.copyWith(birthday: birthday),
          ),
          id,
        );
      }
    });
  }

  void onChanged(DateTime date) {
    emit(state.copyWith(date: date, disabled: false));
  }

  @override
  List<StepWidget> children() => <StepWidget>[
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.dateBirthMessage,
          ),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<BirthdayDateCubit, BirthdayDateState>(
            bloc: this,
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  if (state.isEditing) ...[
                    UiCard(
                      child: SizedBox(
                        height: 180,
                        child: UiDatePicker(
                          date: state.date,
                          onChanged: onChanged,
                        ),
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
                            SignUpI18n.whatUsersSeeMessage,
                            style: context.text.mainTextMedium.copyWith(
                              color: ThemeConfig.smallTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    UiButton(
                      onPressed: _save,
                      suffixIcon: UiIcon(Assets.icons.iCheck),
                      text: SignUpI18n.confirmBtn,
                      disabled: state.disabled,
                    ),
                    const SizedBox(height: Insets.l),
                  ] else ...[
                    UiAnswerMessage(
                      title: SignUpI18n.dateBirthEditModeMessage,
                      content: DateHelper.formatToYMD(state.date),
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

    _stream = result.listen((user) {
      if (state.status.isPure) {
        final value = user.profile.birthday;
        final isInitValue = value == null;

        addChildren(children(), useDuration: isInitValue);

        if (!isInitValue) {
          onChanged(DateTime.parse(value));
          if (initStep != id) {
            onFinish();
          }
        }

        emit(
          state.copyWith(
            user: user,
            isEditing: isInitValue || initStep == id,
            status: StateStatus.fetchingSuccess,
          ),
        );
      }
    });
  }

  @override
  Future<void> close() async {
    await _stream?.cancel();
    await super.close();
  }
}
