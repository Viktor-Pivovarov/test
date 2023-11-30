import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'birthday_time_cubit.freezed.dart';

part 'birthday_time_state.dart';

class BirthdayTimeCubit extends Cubit<BirthdayTimeState>
    implements AbstractRegisterStep {
  BirthdayTimeCubit({
    required SignUpRepository repository,
    required GetUserCase getUserCase,
    required NotifyService notifyService,
  })  : _repository = repository,
        _getUserCase = getUserCase,
        _notifyService = notifyService,
        super(
          BirthdayTimeState.initial(
            date: DateTime.parse('1969-07-20 12:01:00Z'),
          ),
        );

  static StepEnum id = StepEnum.birthtime;

  final SignUpRepository _repository;

  final GetUserCase _getUserCase;

  final NotifyService _notifyService;

  final double minHeight = 50;
  final double maxHeight = 250;
  final List<String> values = <String>['1', '0'];

  final List<Map<String, String>> options = <Map<String, String>>[
    <String, String>{'label': SignUpI18n.birthdayTimeNight, 'value': '02:00'},
    <String, String>{'label': SignUpI18n.birthdayTimeMorning, 'value': '08:00'},
    <String, String>{'label': SignUpI18n.birthdayTimeDay, 'value': '14:00'},
    <String, String>{'label': SignUpI18n.birthdayTimeEvening, 'value': '20:00'},
    <String, String>{
      'label': SignUpI18n.birthdayTimeDoNotKnow,
      'value': '12:00',
    },
  ];

  StreamSubscription<AuthenticatedUser>? _stream;

  String get timeFormatted => DateHelper.formatToLocalTime(state.date);

  late void Function([AuthenticatedUser? data, StepEnum? id]) _onFinish;

  Future<void> _save() async {
    final date = state.date.toString();
    final user = state.user;
    final result = await _repository
        .setBirthTime(DateHelper.formatToLocalTime(state.date));

    result.fold((error) {
      _notifyService.showError(error.message ?? '');
    }, (r) {
      emit(
        state.copyWith(isEditing: false),
      );

      if (user?.vedic != null) {
        _onFinish(
          user?.copyWith(
            vedic: user.vedic.copyWith(birthtime: date),
          ),
          id,
        );
      }
    });
  }

  void updateInitTime(String? birthdayTime) {
    if (birthdayTime != null) {
      emit(
        state.copyWith(
          date: DateTime(
            state.date.year,
            state.date.month,
            state.date.day,
            int.parse(birthdayTime.split(':')[0]),
            int.parse(birthdayTime.split(':')[1]),
          ),
        ),
      );
    }
  }

  void onChangedTime(String time) {
    updateInitTime(time);
    emit(
      state.copyWith(
        disabled: false,
        isSelectedDoNotKnown: false,
        isSelectedTime: true,
      ),
    );
  }

  void onChangedDoNotKnown(String time) {
    updateInitTime(time);
    emit(
      state.copyWith(
        disabled: false,
        isSelectedDoNotKnown: true,
        isSelectedTime: false,
      ),
    );
  }

  void onChangeToggle(int index) {
    var disabled = false;
    if (state.isSelectedDoNotKnown == true && index == 1) {
      disabled = false;
    } else {
      if (state.isSelectedTime == true && index == 0) {
        disabled = false;
      } else {
        disabled = true;
      }
    }
    emit(state.copyWith(knowBirthdayTime: values[index], disabled: disabled));
  }

  @override
  List<StepWidget> children() => <StepWidget>[
        StepWidget(
          typingDuration: 1000,
          readingDuration: 3000,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.aboutAlgorithmMessage,
          ),
        ),
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            child: Text(SignUpI18n.aboutBirthdayTimeMessage),
          ),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<BirthdayTimeCubit, BirthdayTimeState>(
            bloc: this,
            builder: (context, state) {
              return Column(
                children: [
                  if (state.isEditing) ...[
                    UiToggleField(
                      labels: [SignUpI18n.yesBtn, SignUpI18n.noBtn],
                      values: values,
                      selected: state.knowBirthdayTime,
                      onPressed: onChangeToggle,
                    ),
                    _Picker(
                      knowBirthdayTime: state.knowBirthdayTime,
                      date: state.date,
                      onChangedTime: onChangedTime,
                      options: options,
                      onChangedDoNotKnown: onChangedDoNotKnown,
                      timeFormatted: timeFormatted,
                      disabled: false,
                    ),
                    UiButton(
                      disabled: state.disabled,
                      onPressed: _save,
                      suffixIcon: UiIcon(Assets.icons.iCheck),
                      text: SignUpI18n.confirmBtn,
                    ),
                  ] else ...[
                    UiAnswerMessage(
                      title: SignUpI18n.birthdayTimeEditModeMessage,
                      content: DateHelper.formatToLocalTime(state.date),
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
      final value = user.vedic.birthtime;
      final isInitValue = value == null;

      if (state.status.isPure) {
        addChildren(children(), useDuration: isInitValue);

        if (!isInitValue) {
          updateInitTime(value);
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

class _Picker extends StatelessWidget {
  const _Picker({
    required this.knowBirthdayTime,
    required this.date,
    required this.onChangedTime,
    required this.options,
    required this.onChangedDoNotKnown,
    required this.timeFormatted,
    required this.disabled,
  });

  final String knowBirthdayTime;
  final DateTime date;
  final void Function(String value) onChangedTime;
  final List<Map<String, String>> options;
  final void Function(String value) onChangedDoNotKnown;
  final String timeFormatted;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    if (knowBirthdayTime == '1') {
      return _TimePicker(
        date: date,
        onSelectedItemChanged: onChangedTime,
        disabled: disabled,
      );
    }

    return _SelectPicker(
      options: options,
      timeFormatted: timeFormatted,
      onSelectedItemChanged: onChangedDoNotKnown,
    );
  }
}

class _SelectPicker extends StatefulWidget {
  const _SelectPicker({
    required this.options,
    required this.onSelectedItemChanged,
    required this.timeFormatted,
  });

  final List<Map<String, String>> options;
  final void Function(String value) onSelectedItemChanged;
  final String timeFormatted;

  @override
  State<_SelectPicker> createState() => _SelectPickerState();
}

class _SelectPickerState extends State<_SelectPicker> {
  late FormControl<String> control;

  @override
  void initState() {
    super.initState();

    control = FormControl<String>(value: widget.timeFormatted);
  }

  void onChanged(String? value) {
    if (value != null) {
      control.value = value;
      widget.onSelectedItemChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return UiCard(
      margin: const EdgeInsets.only(bottom: Insets.l),
      child: Column(
        children: widget.options
            .map<Widget>(
              (Map<String, String> e) => UiRadioField<String>(
                formControl: control,
                value: e['value'],
                label: e['label']!,
                onChanged: onChanged,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TimePicker extends StatelessWidget {
  const _TimePicker({
    required this.date,
    required this.onSelectedItemChanged,
    this.disabled = false,
  });

  final DateTime date;
  final void Function(String value) onSelectedItemChanged;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UiTimePicker(
          hours: date.hour,
          minutes: date.minute,
          onChange: onSelectedItemChanged,
          disabled: disabled,
        ),
      ],
    );
  }
}
