import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class DatePickerYear extends StatefulWidget {
  const DatePickerYear({
    required this.year,
    required this.onSelectedItemChanged,
    this.disabled = false,
    super.key,
  });

  final int year;
  final void Function(int value) onSelectedItemChanged;
  final bool disabled;

  @override
  State<DatePickerYear> createState() => _DatePickerYearState();
}

class _DatePickerYearState extends State<DatePickerYear> {
  late FixedExtentScrollController controller;
  final DateTime now = DateTime.now();

  late DateTime minDate;
  late DateTime maxDate;

  @override
  void initState() {
    minDate = DateTime(now.year, now.month - 12 * 100, now.day);
    maxDate = DateTime(now.year, now.month - 12 * 18, now.day);

    controller = FixedExtentScrollController(
      initialItem: widget.year - 1 - minDate.year,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollItem(
      controller: controller,
      count: maxDate.year - minDate.year,
      current: widget.year,
      difference: 1 + minDate.year,
      onSelectedItemChanged: widget.onSelectedItemChanged,
      disabled: widget.disabled,
      width: 72,
      itemExtent: 40,
    );
  }
}
