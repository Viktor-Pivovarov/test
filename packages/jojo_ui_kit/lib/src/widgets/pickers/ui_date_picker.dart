import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiDatePicker extends StatefulWidget {
  const UiDatePicker({
    required this.date,
    required this.onChanged,
    this.disabled = false,
    this.maxHeight = 120,
    this.maxWidth = double.infinity,
    super.key,
  });

  final DateTime date;
  final void Function(DateTime value) onChanged;
  final bool disabled;
  final double maxHeight;
  final double maxWidth;

  @override
  State<UiDatePicker> createState() => _UiDatePickerState();
}

class _UiDatePickerState extends State<UiDatePicker> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.date;
  }

  void onSelectedDayChanged(int day) {
    setState(() {
      selectedDate = selectedDate.copyWith(day: day);
    });

    HapticFeedback.selectionClick();

    widget.onChanged(
      selectedDate,
    );
  }

  void onSelectedMonthChanged(int month) {
    final daysInMonth = DateUtils.getDaysInMonth(selectedDate.year, month);

    if (daysInMonth < selectedDate.day) {
      setState(() {
        selectedDate = selectedDate.copyWith(month: month, day: daysInMonth);
      });
    } else {
      setState(() {
        selectedDate = selectedDate.copyWith(month: month);
      });
    }

    HapticFeedback.selectionClick();

    widget.onChanged(
      selectedDate,
    );
  }

  void onSelectedYearChanged(int year) {
    final daysInMonth = DateUtils.getDaysInMonth(year, selectedDate.month);

    if (daysInMonth < selectedDate.day) {
      setState(() {
        selectedDate = selectedDate.copyWith(year: year, day: daysInMonth);
      });
    } else {
      setState(() {
        selectedDate = selectedDate.copyWith(year: year);
      });
    }

    HapticFeedback.selectionClick();

    widget.onChanged(
      selectedDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.maxHeight,
        maxWidth: widget.maxWidth,
      ),
      child: Row(
        children: <Widget>[
          DatePickerDay(
            key: ValueKey(
              DateUtils.getDaysInMonth(selectedDate.year, selectedDate.month),
            ),
            day: selectedDate.day,
            days:
                DateUtils.getDaysInMonth(selectedDate.year, selectedDate.month),
            onSelectedItemChanged: onSelectedDayChanged,
            disabled: widget.disabled,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.s),
            child: Text(
              ':',
              style: context.texts.headline.second
                  .copyWith(color: context.colors.text.main),
            ),
          ),
          DatePickerMonth(
            month: selectedDate.month,
            onSelectedItemChanged: onSelectedMonthChanged,
            disabled: widget.disabled,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.s),
            child: Text(
              ':',
              style: context.texts.headline.second
                  .copyWith(color: context.colors.text.main),
            ),
          ),
          DatePickerYear(
            year: selectedDate.year,
            onSelectedItemChanged: onSelectedYearChanged,
            disabled: widget.disabled,
          ),
        ],
      ),
    );
  }
}
