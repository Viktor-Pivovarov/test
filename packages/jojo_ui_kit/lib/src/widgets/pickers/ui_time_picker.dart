// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiTimePicker extends StatefulWidget {
  const UiTimePicker({
    super.key,
    this.onChange,
    this.hours,
    this.minutes,
    this.label,
    this.disabled = false,
    this.maxWidth = double.infinity,
    this.maxHeight = 120,
  });

  final String? label;
  final int? hours;
  final int? minutes;
  final void Function(String value)? onChange;

  final bool disabled;

  final double maxWidth;

  final double maxHeight;

  @override
  State<UiTimePicker> createState() => _UiTimePickerState();
}

class _UiTimePickerState extends State<UiTimePicker> {
  late FixedExtentScrollController fixedExtentScrollControllerHours;
  late FixedExtentScrollController fixedExtentScrollControllerMinutes;

  late int selectedHour;
  late int selectedMinute;

  @override
  void initState() {
    selectedMinute = widget.minutes ?? 0;
    selectedHour = widget.hours ?? 0;

    fixedExtentScrollControllerHours =
        FixedExtentScrollController(initialItem: selectedHour);
    fixedExtentScrollControllerMinutes =
        FixedExtentScrollController(initialItem: selectedMinute);

    super.initState();
  }

  void onChangeHours(int hour) {
    setState(() {
      selectedHour = hour;
    });

    HapticFeedback.selectionClick();

    widget.onChange?.call(
      _formatString(),
    );
  }

  String _formatString() {
    return '${selectedHour.toString().padLeft(2, '0')}:${selectedMinute.toString().padLeft(2, '0')}';
  }

  void onChangeMinutes(int minute) {
    setState(() {
      selectedMinute = minute;
    });

    HapticFeedback.selectionClick();

    widget.onChange?.call(
      _formatString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: widget.maxWidth,
            maxHeight: widget.maxHeight,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListWheelScrollView(
                  controller: fixedExtentScrollControllerHours,
                  onSelectedItemChanged: onChangeHours,
                  scrollBehavior:
                      const ScrollBehavior().copyWith(overscroll: false),
                  itemExtent: 40,
                  overAndUnderCenterOpacity: 0.2,
                  diameterRatio: 3,
                  physics: widget.disabled
                      ? const NeverScrollableScrollPhysics()
                      : const FixedExtentScrollPhysics(),
                  children: List<Widget>.generate(
                    24,
                    (int index) => _TimePickerNumber(
                      disabled: widget.disabled,
                      text: (index).toString(),
                      isCurrent: index == selectedHour,
                    ),
                  ),
                ),
              ),
              Text(
                ':',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 32),
              ),
              Expanded(
                child: ListWheelScrollView(
                  controller: fixedExtentScrollControllerMinutes,
                  onSelectedItemChanged: onChangeMinutes,
                  scrollBehavior:
                      const ScrollBehavior().copyWith(overscroll: false),
                  itemExtent: 40,
                  overAndUnderCenterOpacity: 0.2,
                  diameterRatio: 3,
                  physics: widget.disabled
                      ? const NeverScrollableScrollPhysics()
                      : const FixedExtentScrollPhysics(),
                  children: List<Widget>.generate(
                    60,
                    (int index) => _TimePickerNumber(
                      disabled: widget.disabled,
                      text: (index).toString(),
                      isCurrent: index == selectedMinute,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimePickerNumber extends StatelessWidget {
  const _TimePickerNumber({
    required this.text,
    required this.isCurrent,
    this.disabled = false,
  });

  final String text;
  final bool isCurrent;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: Insets.xs),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: isCurrent
                ? disabled
                    ? context.colors.button.disabled
                    : context.colors.content.brand
                : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        text.padLeft(2, '0'),
        textAlign: TextAlign.center,
        style: context.texts.headline.second
            .copyWith(color: context.colors.text.main),
      ),
    );
  }
}
