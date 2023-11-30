import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiBadge extends StatelessWidget {
  const UiBadge({super.key, this.color, this.text});

  final Color? color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color ?? context.color.mainAccentColor,
      ),
      child: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            height: 1,
          ),
          child: Text(
            text ?? '',
            style: context.text.mainText.copyWith(
              height: 1,
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
