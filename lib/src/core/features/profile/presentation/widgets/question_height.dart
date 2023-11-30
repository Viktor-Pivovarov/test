import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class QuestionHeight extends StatefulWidget {
  const QuestionHeight({required this.value, super.key});

  final int value;

  @override
  State<QuestionHeight> createState() => _QuestionHeightState();
}

class _QuestionHeightState extends State<QuestionHeight> {
  int value = 0;

  @override
  void initState() {
    super.initState();

    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: UiNumberSlider(
        from: 50,
        to: 250,
        value: value,
        label: 'centimeters',
        onSelectedItemChanged: (int newValue) {
          setState(() {
            value = newValue;
          });
        },
      ),
    );
  }
}
