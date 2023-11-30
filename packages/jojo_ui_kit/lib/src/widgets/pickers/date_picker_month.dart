import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class DatePickerMonth extends StatefulWidget {
  const DatePickerMonth({
    required this.month,
    required this.onSelectedItemChanged,
    this.disabled = false,
    super.key,
  });

  final int month;
  final void Function(int value) onSelectedItemChanged;
  final bool disabled;

  @override
  State<DatePickerMonth> createState() => _DatePickerMonthState();
}

class _DatePickerMonthState extends State<DatePickerMonth> {
  late FixedExtentScrollController controller;

  @override
  void initState() {
    controller = FixedExtentScrollController(initialItem: widget.month - 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollItem(
      controller: controller,
      count: 12,
      current: widget.month,
      difference: 1,
      onSelectedItemChanged: widget.onSelectedItemChanged,
      disabled: widget.disabled,
      width: 36,
      itemExtent: 40,
    );
  }
}
