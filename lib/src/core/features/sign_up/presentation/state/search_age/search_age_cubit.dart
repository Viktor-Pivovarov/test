import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'search_age_cubit.freezed.dart';
part 'search_age_state.dart';

class SearchAgeCubit extends Cubit<SearchAgeState>
    implements AbstractRegisterStep {
  SearchAgeCubit({
    required SignUpRepository repository,
    required GetUserCase getUserCase,
    required NotifyService notifyService,
  })  : _repository = repository,
        _getUserCase = getUserCase,
        _notifyService = notifyService,
        super(const SearchAgeState.initial());

  static StepEnum id = StepEnum.searchAge;

  final int from = 18;
  final int to = 99;

  final GetUserCase _getUserCase;

  final NotifyService _notifyService;

  late void Function([AuthenticatedUser? data, StepEnum? id]) _onFinish;
  final SignUpRepository _repository;
  StreamSubscription<AuthenticatedUser>? _stream;

  @override
  List<StepWidget> children() => <StepWidget>[
        StepWidget(
          typingDuration: 1000,
          readingDuration: 1000,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.userPreferenceMessage,
          ),
        ),
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.desiredAgeMessage,
          ),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<SearchAgeCubit, SearchAgeState>(
            bloc: this,
            builder: (context, state) {
              return Column(
                children: [
                  if (state.isEditing) ...[
                    UiAgePicker(
                      labelFrom: '${SignUpI18n.fromLabel}:',
                      labelTo: '${SignUpI18n.toLabel}:',
                      from: from,
                      to: to,
                      onChange: onChanged,
                      defaultFrom: state.ageFrom,
                      defaultTo: state.ageTo,
                    ),
                    UiButton(
                      disabled: state.disabled,
                      onPressed: _save,
                      suffixIcon: UiIcon(Assets.icons.iCheck),
                      text: SignUpI18n.confirmBtn,
                    ),
                  ] else ...[
                    UiAnswerMessage(
                      title: SignUpI18n.candidatesAgeEditModeMessage,
                      content:
                          '${SignUpI18n.fromLabel} ${state.ageFrom} ${SignUpI18n.toLabel.toLowerCase()} ${state.ageTo}',
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
  Future<void> close() async {
    await _stream?.cancel();
    await super.close();
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

    _stream = result.listen((user) {
      emit(state.copyWith(user: user));

      if (state.status.isPure) {
        final value = user.preference.ageFrom;
        final isInitValue = value == null;

        addChildren(children(), useDuration: isInitValue);

        if (!isInitValue) {
          onChanged(user.preference.ageFrom, user.preference.ageTo);
          if (initStep != id) {
            onFinish();
          }
        }

        emit(
          state.copyWith(
            isEditing: isInitValue || initStep == id,
            status: StateStatus.fetchingSuccess,
          ),
        );
      }
    });
  }

  void onChanged(int? from, int? to) {
    if (from != null && to != null) {
      emit(
        state.copyWith(
          ageFrom: from,
          ageTo: to,
          disabled: false,
        ),
      );
    }
  }

  Future<void> _save() async {
    final ageFrom = state.ageFrom;
    final ageTo = state.ageTo;
    final user = state.user;
    final result = await _repository.setSearchAge(ageFrom, ageTo);

    result.fold((error) {
      _notifyService.showError(error.message ?? '');
    }, (r) {
      emit(
        state.copyWith(isEditing: false),
      );

      if (user?.searcher != null) {
        _onFinish(
          user?.copyWith(
            preference:
                user.preference.copyWith(ageFrom: ageFrom, ageTo: ageTo),
          ),
          id,
        );
      }
    });
  }
}
