import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class AlgorithmFactWidget extends StatelessWidget {
  const AlgorithmFactWidget({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Insets.xs),
          child: UiIcon(
            Assets.icons.iCheck,
            color: context.color.mainAccentColor,
          ),
        ),
        const SizedBox(width: Insets.m),
        Expanded(
          child: Text(
            text,
            style: context.text.mainText
                .copyWith(color: context.color.smallTextColor),
          ),
        ),
      ],
    );
  }
}
