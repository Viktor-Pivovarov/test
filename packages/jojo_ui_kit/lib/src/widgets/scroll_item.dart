import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ScrollItem extends StatelessWidget {
  const ScrollItem({
    required this.controller,
    required this.onSelectedItemChanged,
    required this.count,
    required this.current,
    required this.difference,
    this.disabled = false,
    this.axis = Axis.vertical,
    this.textStyle,
    this.itemExtent = 62,
    this.width,
    super.key,
  });

  final FixedExtentScrollController controller;
  final ValueChanged<int> onSelectedItemChanged;

  final int difference;
  final int count;
  final int current;
  final bool disabled;
  final Axis axis;
  final TextStyle? textStyle;
  final double itemExtent;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RotatedBox(
        quarterTurns: axis == Axis.vertical ? 0 : -1,
        child: ListWheelScrollView(
          scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
          physics: disabled
              ? const NeverScrollableScrollPhysics()
              : const FixedExtentScrollPhysics(),
          controller: controller,
          onSelectedItemChanged: (int value) =>
              onSelectedItemChanged(value + difference),
          itemExtent: itemExtent,
          overAndUnderCenterOpacity: 0.2,
          diameterRatio: 13,
          children: List<Widget>.generate(
            count,
            (int index) => RotatedBox(
              quarterTurns: axis == Axis.vertical ? 0 : 1,
              child: Container(
                width: width,
                //    padding: const EdgeInsets.symmetric(vertical: Insets.s * 1.5),
                padding: const EdgeInsets.only(top: Insets.xs),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: index + difference == current
                          ? disabled
                              ? context.colors.button.disabled
                              : context.colors.content.brand
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  (index + difference).toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      context.texts.headline.second
                          .copyWith(color: context.colors.text.main),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
