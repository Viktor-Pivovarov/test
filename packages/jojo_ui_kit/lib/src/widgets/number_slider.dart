import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@Deprecated('Use UiRouletteControl')
class UiNumberSlider extends StatefulWidget {
  const UiNumberSlider({
    required this.from,
    required this.to,
    required this.value,
    required this.onSelectedItemChanged,
    this.disabled = false,
    this.height = Insets.xxxxl,
    this.width = double.infinity,
    this.label,
    super.key,
  });

  final int from;
  final int to;
  final int value;
  final bool disabled;
  final double width;
  final double height;
  final String? label;

  final void Function(int) onSelectedItemChanged;

  @override
  State<UiNumberSlider> createState() => _UiNumberSliderState();
}

class _UiNumberSliderState extends State<UiNumberSlider> {
  late int currentValue;

  late FixedExtentScrollController controller;

  @override
  void initState() {
    super.initState();
    currentValue = widget.value;

    controller = FixedExtentScrollController(
      initialItem: currentValue - widget.from,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              children: [
                ScrollItem(
                  axis: Axis.horizontal,
                  textStyle:
                      context.text.numbers.copyWith(fontSize: 32, height: 1),
                  controller: controller,
                  itemExtent: 76,
                  count: widget.to - widget.from,
                  current: currentValue,
                  difference: widget.from,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });

                    HapticFeedback.selectionClick();

                    widget.onSelectedItemChanged.call(value);
                  },
                  disabled: widget.disabled,
                ),
              ],
            ),
          ),
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Insets.s),
              child: Text(
                widget.label!,
              ),
            ),
        ],
      ),
    );
  }
}
