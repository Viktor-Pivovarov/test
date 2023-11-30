import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class DatePickerDay extends StatefulWidget {
  const DatePickerDay({
    required this.day,
    required this.days,
    required this.onSelectedItemChanged,
    this.disabled = false,
    super.key,
  });

  final int day;
  final int days;
  final void Function(int value) onSelectedItemChanged;
  final bool disabled;

  @override
  State<DatePickerDay> createState() => _DatePickerDayState();
}

class _DatePickerDayState extends State<DatePickerDay> {
  late FixedExtentScrollController controller;

  @override
  void initState() {
    controller = FixedExtentScrollController(initialItem: widget.day - 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollItem(
      controller: controller,
      count: widget.days,
      current: widget.day,
      difference: 1,
      onSelectedItemChanged: widget.onSelectedItemChanged,
      disabled: widget.disabled,
      width: 36,
      itemExtent: 40,
    );
  }
}
