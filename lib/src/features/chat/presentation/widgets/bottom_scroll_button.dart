import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiBottomScrollButton extends StatelessWidget {
  const UiBottomScrollButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.button.disabled,
        ),
        child: UiIcon.button(
          AssetsNew.icons.dsArrowDown.path,
          onPressed: onPressed,
          color: context.colors.text.constantWhite,
        ),
      ),
    );
  }
}
