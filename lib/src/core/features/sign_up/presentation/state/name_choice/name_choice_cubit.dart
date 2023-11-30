import 'dart:async';

import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'name_choice_cubit.freezed.dart';

part 'name_choice_state.dart';

class NameChoiceCubit extends Cubit<NameChoiceState>
    implements AbstractRegisterStep {
  NameChoiceCubit({
    required SignUpRepository repository,
    required GetUserCase getUserCase,
    required NotifyService notifyService,
  })  : _repository = repository,
        _getUserCase = getUserCase,
        _notifyService = notifyService,
        super(const NameChoiceState.initial());

  static StepEnum id = StepEnum.firstName;

  final SignUpRepository _repository;

  final GetUserCase _getUserCase;

  final NotifyService _notifyService;

  final FormControl<String> formControl = FormControl<String>(
    validators: <Validator<dynamic>>[
      Validators.pattern(JoJoSDKConstants.nameReg),
    ],
  );

  late void Function(
    List<StepWidget>? children, {
    bool useDuration,
  }) _addChildren;

  late void Function([AuthenticatedUser? data, StepEnum? id]) _onFinish;

  StreamSubscription<AuthenticatedUser>? _stream;

  void onChanged(String name) {
    formControl.value = name;
    emit(state.copyWith(name: name));
  }

  void setIsWelcomeAdded(bool isWelcomeAdded) {
    if (!state.isWelcomeAdded) {
      emit(state.copyWith(isWelcomeAdded: isWelcomeAdded));
    }
  }

  void welcomeByName({bool useDuration = true}) {
    if (!state.isWelcomeAdded) {
      _addChildren(
        [
          StepWidget(
            typingDuration: 500,
            readingDuration: 3000,
            child: const UiMessage(isTyping: true),
            replaceChild: BlocBuilder<NameChoiceCubit, NameChoiceState>(
              bloc: this,
              builder: (context, state) {
                return UiMessage(
                  content: SignUpI18n.botGreetingsMessage(state.name),
                );
              },
            ),
          ),
        ],
        useDuration: useDuration,
      );

      setIsWelcomeAdded(true);
    }
  }

  Future<void> _save() async {
    if (formControl.errors.isNotEmpty) {
      emit(
        state.copyWith(isValid: true),
      );
      return;
    }

    final String? nameResult = formControl.value;
    if (nameResult != null && nameResult.isNotEmpty) {
      final user = state.user;
      final result = await _repository.setFirstName(nameResult);

      result.fold((error) {
        _notifyService.showError(error.message ?? '');
      }, (r) {
        welcomeByName();

        onChanged(nameResult);

        emit(
          state.copyWith(isEditing: false),
        );

        if (user?.profile != null) {
          _onFinish(
            user?.copyWith(
              profile: user.profile.copyWith(firstName: nameResult),
            ),
            id,
          );
        }
      });
    }
  }

  @override
  List<StepWidget> children({bool? useDuration}) => <StepWidget>[
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.botHelloMessage,
          ),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<NameChoiceCubit, NameChoiceState>(
            bloc: this,
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  if (state.isEditing) ...[
                    UiTextField<String>(
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      hintText: SignUpI18n.enterNameFieldHint,
                      formControl: formControl,
                      onChanged: (formControlValue) {
                        final result = formControlValue.value;
                        if (result != null) {
                          emit(
                            state.copyWith(name: result),
                          );
                        }
                      },
                      showErrors: state.isValid,
                      validationMessages: <String, String Function(Object)>{
                        'pattern': (_) {
                          return SignUpI18n.nameErrorMessage;
                        },
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Insets.l,
                      ),
                      child: UiButton(
                        disabled: state.name.isEmpty,
                        onPressed: _save,
                        suffixIcon: UiIcon(Assets.icons.iCheck),
                        text: SignUpI18n.confirmBtn,
                      ),
                    ),
                  ] else ...[
                    UiAnswerMessage(
                      content: state.name,
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
    _addChildren = addChildren;
    _onFinish = onFinish;

    final result = await _getUserCase(NoParams());

    _stream = result.listen(
      (user) {
        if (state.status.isPure) {
          final value = user.profile.firstName;
          final isInitValue = value == null;

          addChildren(
            children(),
            useDuration: isInitValue,
          );

          if (!isInitValue) {
            onChanged(value);
            welcomeByName(useDuration: isInitValue);
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
      },
    );
  }

  @override
  Future<void> close() async {
    await _stream?.cancel();
    await super.close();
  }
}
