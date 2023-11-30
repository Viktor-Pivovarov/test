import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiMainButton extends StatelessWidget {
  const UiMainButton({
    required this.text,
    super.key,
    this.type = UiMainButtonType.defaultType,
    this.disabled = false,
    this.onPressed,
    this.padding = const EdgeInsets.only(
      left: Insets.l,
      right: Insets.l,
      bottom: Insets.l,
    ),
  });

  final UiMainButtonType type;

  final String text;

  final bool disabled;

  final VoidCallback? onPressed;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: _getGradient(context),
          borderRadius: BorderRadius.circular(Insets.xl),
        ),
        child: ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: _getButtonStyle(context),
          child: Text(
            text,
            style: context.texts.button.button,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Gradient? _getGradient(BuildContext context) =>
      type == UiMainButtonType.brandGradient && !disabled
          ? context.colors.content.brandGradient
          : null;

  ButtonStyle? _getButtonStyle(BuildContext context) {
    switch (type) {
      case UiMainButtonType.defaultType:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: context.colors.button.disabled,
          backgroundColor: context.colors.button.brand,
          disabledForegroundColor: Colors.white,
          foregroundColor: Colors.white,
        );
      case UiMainButtonType.inverse:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: context.colors.button.disabled,
          backgroundColor: context.colors.button.inverse,
          disabledForegroundColor: Colors.white,
          foregroundColor: context.colors.button.brand,
        );
      case UiMainButtonType.transparent:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          disabledForegroundColor: context.colors.button.disabled,
          foregroundColor: context.colors.button.brand,
        );
      case UiMainButtonType.outline:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          disabledForegroundColor: context.colors.button.disabled,
          foregroundColor: context.colors.button.brand,
          side: BorderSide(
            color: disabled
                ? context.colors.button.disabled
                : context.colors.button.brand,
          ),
        );
      case UiMainButtonType.brandGradient:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: context.colors.button.disabled,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        );
    }
  }
}

enum UiMainButtonType {
  defaultType,
  inverse,
  transparent,
  outline,
  brandGradient
}
