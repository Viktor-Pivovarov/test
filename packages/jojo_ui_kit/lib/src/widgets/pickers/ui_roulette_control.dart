import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiRouletteControl extends StatefulWidget {
  const UiRouletteControl({
    required this.from,
    required this.to,
    required this.value,
    required this.onSelectedItemChanged,
    this.disabled = false,
    this.label,
    super.key,
    this.maxHeight = Insets.xxxxl,
    this.maxWidth = double.infinity,
  });

  final int from;
  final int to;
  final int value;
  final bool disabled;
  final double maxWidth;
  final double maxHeight;
  final String? label;

  final void Function(int) onSelectedItemChanged;

  @override
  State<UiRouletteControl> createState() => _UiRouletteControlState();
}

class _UiRouletteControlState extends State<UiRouletteControl> {
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.maxHeight,
        maxWidth: widget.maxWidth,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              children: [
                ScrollItem(
                  axis: Axis.horizontal,
                  textStyle: context.texts.headline.big
                      .copyWith(color: context.colors.system.base),
                  controller: controller,
                  itemExtent: 64,
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
            Text(
              widget.label!,
              style: context.texts.footnote.base.copyWith(color: Colors.black),
            ),
        ],
      ),
    );
  }
}
