import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiCardTextButton extends StatelessWidget {
  const UiCardTextButton({
    required this.text,
    required this.hint,
    required this.icon,
    this.useDivider = true,
    super.key,
    this.color,
    this.onPressed,
  });

  final String text;
  final String hint;

  final UiIcon icon;

  final Color? color;

  final VoidCallback? onPressed;

  final bool useDivider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: Insets.m),
              child: icon,
            ),
            const SizedBox(
              width: Insets.l,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: context.text.smallTitleMedium.copyWith(
                      color: color ?? context.color.textColor,
                    ),
                  ),
                  Text(
                    hint,
                    style: context.text.mainText
                        .copyWith(color: context.color.smallTextColor),
                  ),
                  if (useDivider) const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
