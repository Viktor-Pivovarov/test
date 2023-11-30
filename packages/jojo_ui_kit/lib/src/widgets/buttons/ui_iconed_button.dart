// ignore_for_file: no_default_cases

import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiIconedButton extends StatelessWidget {
  const UiIconedButton({
    required this.text,
    required this.icon,
    super.key,
    this.type = UiIconedButtonType.base,
    this.disabled = false,
    this.onPressed,
    this.padding = const EdgeInsets.only(
        left: Insets.l, right: Insets.l, bottom: Insets.l),
  });

  final UiIconedButtonType type;

  final String text;

  final bool disabled;

  final VoidCallback? onPressed;

  final EdgeInsets padding;

  final UiIcon icon;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: _getIconTheme(context),
      ),
      child: Padding(
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
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: context.texts.button.button,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                icon,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Gradient? _getGradient(BuildContext context) =>
      type == UiIconedButtonType.brandGradient && !disabled
          ? context.colors.content.brandGradient
          : null;

  IconThemeData? _getIconTheme(BuildContext context) {
    switch (type) {
      case UiIconedButtonType.outline:
        return IconThemeData(
          color: disabled
              ? context.colors.button.disabled
              : context.colors.button.brand,
        );

      case UiIconedButtonType.base:
      case UiIconedButtonType.brandGradient:
      case UiIconedButtonType.green:
      case UiIconedButtonType.blue:
        return IconThemeData(
          color: context.colors.content.inverse,
        );
    }
  }

  ButtonStyle? _getButtonStyle(BuildContext context) {
    switch (type) {
      case UiIconedButtonType.base:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: context.colors.button.disabled,
          backgroundColor: context.colors.button.brand,
          disabledForegroundColor: Colors.white,
          foregroundColor: Colors.white,
        );
      case UiIconedButtonType.green:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: context.colors.button.disabled,
          backgroundColor: context.colors.button.positive,
          disabledForegroundColor: Colors.white,
          foregroundColor: Colors.white,
        );
      case UiIconedButtonType.blue:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: context.colors.button.disabled,
          backgroundColor: context.colors.button.telegram,
          disabledForegroundColor: Colors.white,
          foregroundColor: Colors.white,
        );
      case UiIconedButtonType.outline:
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
      case UiIconedButtonType.brandGradient:
        return ElevatedButton.styleFrom(
          disabledBackgroundColor: context.colors.button.disabled,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        );
    }
  }
}

enum UiIconedButtonType { base, brandGradient, green, outline, blue }
