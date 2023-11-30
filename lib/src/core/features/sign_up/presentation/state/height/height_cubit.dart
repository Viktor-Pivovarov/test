import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'height_cubit.freezed.dart';

part 'height_state.dart';

class HeightCubit extends Cubit<HeightState> implements AbstractRegisterStep {
  HeightCubit({
    required SignUpRepository repository,
    required GetUserCase getUserCase,
    required NotifyService notifyService,
  })  : _repository = repository,
        _getUserCase = getUserCase,
        _notifyService = notifyService,
        super(const HeightState.initial());

  static StepEnum id = StepEnum.height;

  final SignUpRepository _repository;

  final GetUserCase _getUserCase;

  final NotifyService _notifyService;

  final int minHeight = 50;
  final int maxHeight = 250;

  late void Function([AuthenticatedUser? data, StepEnum? id]) _onFinish;

  StreamSubscription<AuthenticatedUser>? _stream;

  Future<void> _save() async {
    final height = state.height;
    final user = state.user;
    final result = await _repository.setHeight(height);

    result.fold((error) {
      _notifyService.showError(error.message ?? '');
    }, (r) {
      emit(
        state.copyWith(isEditing: false),
      );

      if (user?.searcher != null) {
        _onFinish(
          user?.copyWith(
            searcher: user.searcher.copyWith(height: height),
          ),
          id,
        );
      }
    });
  }

  void onChanged(int value) {
    emit(
      state.copyWith(
        height: value,
        disabled: false,
      ),
    );
  }

  @override
  List<StepWidget> children() => <StepWidget>[
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.aboutHeightMessage,
          ),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<HeightCubit, HeightState>(
            bloc: this,
            builder: (context, state) {
              return Column(
                children: [
                  if (state.isEditing) ...[
                    UiCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: UiNumberSlider(
                                  from: minHeight,
                                  to: maxHeight,
                                  value: state.height,
                                  onSelectedItemChanged: onChanged,
                                  label: SignUpI18n.centimetersLabel,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    UiButton(
                      disabled: state.disabled,
                      onPressed: _save,
                      suffixIcon: UiIcon(Assets.icons.iCheck),
                      text: SignUpI18n.confirmBtn,
                    ),
                  ] else ...[
                    UiAnswerMessage(
                      title: SignUpI18n.myHeightEditModeMessage,
                      content:
                          '${state.height} ${SignUpI18n.cmEditModeMessage}',
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
      emit(state.copyWith(user: user));

      if (state.status.isPure) {
        final value = user.searcher.height;
        final isInitValue = value == null;

        addChildren(children(), useDuration: isInitValue);

        if (!isInitValue) {
          onChanged(value);
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

  @override
  Future<void> close() async {
    await _stream?.cancel();
    await super.close();
  }
}
