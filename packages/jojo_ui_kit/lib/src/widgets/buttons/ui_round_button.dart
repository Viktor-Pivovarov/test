import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiRoundButton extends StatelessWidget {
  const UiRoundButton({
    required this.icon,
    super.key,
    this.type = UiRoundButtonType.red,
    this.disabled = false,
    this.onPressed,
    this.padding =
        const EdgeInsets.symmetric(horizontal: Insets.m, vertical: Insets.m),
  });

  final UiRoundButtonType type;

  final bool disabled;

  final VoidCallback? onPressed;

  final EdgeInsets padding;

  final UiIcon icon;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(
          color: context.colors.content.inverse,
        ),
      ),
      child: UIShadow.button(
        boxShadow: disabled ? [] : [_getBoxShadow(context)],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Insets.xxxl),
          child: Material(
            color: _getButtonColor(context),
            child: InkWell(
              onTap: !disabled ? onPressed : null,
              child: Container(
                padding: padding,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxShadow _getBoxShadow(BuildContext context) {
    switch (type) {
      case UiRoundButtonType.red:
        return context.effects.redGlow;
      case UiRoundButtonType.green:
        return context.effects.greenGlow;
    }
  }

  Color _getButtonColor(BuildContext context) {
    switch (type) {
      case UiRoundButtonType.red:
        return disabled
            ? context.colors.button.disabled
            : context.colors.button.brand;
      case UiRoundButtonType.green:
        return disabled
            ? context.colors.button.disabled
            : context.colors.button.positive;
    }
  }
}

enum UiRoundButtonType {
  red,
  green,
}
