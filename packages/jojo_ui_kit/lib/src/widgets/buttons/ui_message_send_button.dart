import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiMessageSendButton extends StatelessWidget {
  const UiMessageSendButton({
    super.key,
    this.disabled = false,
    this.onPressed,
    this.padding =
        const EdgeInsets.symmetric(horizontal: Insets.s, vertical: Insets.s),
    this.asset,
  });

  final bool disabled;

  final VoidCallback? onPressed;

  final EdgeInsets padding;

  final String? asset;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(
          color: context.colors.content.inverse,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Insets.xxxl),
        child: Material(
          color: context.colors.button.disabled,
          child: InkWell(
            onTap: !disabled ? onPressed : null,
            child: Container(
              padding: padding,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: UiIcon(asset ?? AssetsNew.icons.dsArrowUp.path),
            ),
          ),
        ),
      ),
    );
  }
}
