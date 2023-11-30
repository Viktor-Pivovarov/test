import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiMiniButton extends StatelessWidget {
  const UiMiniButton({
    required this.text,
    super.key,
    this.type = UiMiniButtonType.defaultType,
    this.disabled = false,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: Insets.l),
  });

  final UiMiniButtonType type;

  final String text;

  final bool disabled;

  final VoidCallback? onPressed;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Insets.xl),
        ),
        child: ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: _getButtonStyle(context),
          child: Text(
            text,
            style: context.texts.body.baseSemibold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  ButtonStyle? _getButtonStyle(BuildContext context) {
    switch (type) {
      case UiMiniButtonType.defaultType:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: context.colors.button.disabled,
          backgroundColor: context.colors.button.brand,
          disabledForegroundColor: Colors.white,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: Insets.s,
            horizontal: Insets.l,
          ),
          minimumSize: Size.zero,
        );
      case UiMiniButtonType.inverse:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: context.colors.button.disabled,
          backgroundColor: context.colors.button.inverse,
          disabledForegroundColor: Colors.white,
          foregroundColor: context.colors.text.main,
          padding: const EdgeInsets.symmetric(
            vertical: Insets.s,
            horizontal: Insets.l,
          ),
          minimumSize: Size.zero,
        );
    }
  }
}

enum UiMiniButtonType {
  defaultType,
  inverse,
}
