import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _itemExtent = 40.0;

class UiAgePicker extends StatefulWidget {
  UiAgePicker({
    this.from = 18,
    int to = 100,
    int? defaultFrom,
    int? defaultTo,
    this.disabled = false,
    this.labelFrom,
    this.labelTo,
    this.onChange,
    this.changeAtStart = false,
    this.maxHeight = 120,
    this.maxWidth = double.infinity,
    super.key,
  }) {
    if (to <= from) {
      this.to = from + 100;
    } else {
      this.to = to;
    }

    if (defaultFrom != null && defaultFrom >= from) {
      this.defaultFrom = defaultFrom;
    } else {
      this.defaultFrom = from;
    }

    if (defaultTo != null && defaultTo <= to && this.defaultFrom <= defaultTo) {
      this.defaultTo = defaultTo;
    } else {
      this.defaultTo = this.to;
    }
  }
  final int from;
  late final int to;

  late final int defaultFrom;
  late final int defaultTo;

  final String? labelFrom;
  final String? labelTo;

  final bool disabled;

  final bool changeAtStart;

  final void Function(int from, int to)? onChange;

  final double maxWidth;

  final double maxHeight;

  @override
  State<UiAgePicker> createState() => _UiAgePickerState();
}

class _UiAgePickerState extends State<UiAgePicker> {
  late int currentFrom;
  late int currentTo;

  late FixedExtentScrollController fixedExtentScrollControllerFrom;
  late FixedExtentScrollController fixedExtentScrollControllerTo;

  late List<int> fromList;
  late List<int> toList;

  @override
  void initState() {
    super.initState();
    currentFrom = widget.defaultFrom;
    currentTo = widget.defaultTo;

    fromList = generateList(widget.from, widget.to);
    toList = generateList(currentFrom, widget.to);

    fixedExtentScrollControllerFrom =
        FixedExtentScrollController(initialItem: fromList.indexOf(currentFrom));
    fixedExtentScrollControllerTo =
        FixedExtentScrollController(initialItem: toList.indexOf(currentTo));

    if (widget.changeAtStart) {
      widget.onChange?.call(
        currentFrom,
        currentTo,
      );
    }
  }

  void onChangeFrom(int from) {
    setState(() {
      currentFrom = fromList[from];
      toList = generateList(currentFrom, widget.to);

      if (currentFrom > currentTo) {
        currentTo = currentFrom;
      }
    });
    fixedExtentScrollControllerTo.jumpToItem(toList.indexOf(currentTo));

    HapticFeedback.selectionClick();

    widget.onChange?.call(
      currentFrom,
      currentTo,
    );
  }

  void onChangeTo(int to) {
    if (currentTo != toList[to]) {
      setState(() {
        currentTo = toList[to];
      });

      HapticFeedback.selectionClick();

      widget.onChange?.call(
        currentFrom,
        currentTo,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 136,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.labelFrom ?? '',
                  style: context.texts.body.bigSemibold
                      .copyWith(color: context.colors.system.base),
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(
                child: ListWheelScrollView(
                  controller: fixedExtentScrollControllerFrom,
                  onSelectedItemChanged: onChangeFrom,
                  scrollBehavior:
                      const ScrollBehavior().copyWith(overscroll: false),
                  itemExtent: _itemExtent,
                  overAndUnderCenterOpacity: 0.2,
                  diameterRatio: 3,
                  physics: widget.disabled
                      ? const NeverScrollableScrollPhysics()
                      : const FixedExtentScrollPhysics(),
                  children: fromList
                      .map(
                        (e) => _AgePickerNumber(
                          disabled: widget.disabled,
                          text: e.toString(),
                          isCurrent: e == currentFrom,
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: Text(
                  widget.labelTo ?? '',
                  style: context.texts.body.bigSemibold
                      .copyWith(color: context.colors.system.base),
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(
                child: ListWheelScrollView(
                  controller: fixedExtentScrollControllerTo,
                  scrollBehavior:
                      const ScrollBehavior().copyWith(overscroll: false),
                  onSelectedItemChanged: onChangeTo,
                  itemExtent: _itemExtent,
                  overAndUnderCenterOpacity: 0.2,
                  diameterRatio: 3,
                  physics: widget.disabled
                      ? const NeverScrollableScrollPhysics()
                      : const FixedExtentScrollPhysics(),
                  children: toList
                      .map(
                        (e) => _AgePickerNumber(
                          disabled: widget.disabled,
                          text: e.toString(),
                          isCurrent: e == currentTo,
                        ),
                      )
                      .toList(),
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
        ),
      ],
    );
  }

  List<int> generateList(int from, int to) {
    return List.generate(to - from + 1, (index) => index + from);
  }
}

class _AgePickerNumber extends StatelessWidget {
  const _AgePickerNumber({
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
