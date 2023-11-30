import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiGoogleButton extends StatelessWidget {
  const UiGoogleButton({
    required this.text,
    super.key,
    this.disabled = false,
    this.onPressed,
    this.padding = const EdgeInsets.only(
      left: Insets.l,
      right: Insets.l,
      bottom: Insets.l,
    ),
  });

  final String text;

  final bool disabled;

  final VoidCallback? onPressed;

  final EdgeInsets padding;

  static const double _circleRadius = 22;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: UIShadow(
        boxShadow: [
          context.effects.blueGlow,
        ],
        child: ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colors.system.base,
            padding: const EdgeInsets.only(left: Insets.xxs),
          ),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: _circleRadius,
                backgroundColor: context.colors.text.constantWhite,
                child: UiIcon(
                  AssetsNew.icons.google.path,
                  color: context.colors.text.constantWhite,
                  useColor: false,
                ),
              ),
              const SizedBox(
                width: Insets.xl,
              ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: context.texts.button.button
                      .copyWith(color: context.colors.text.constantWhite),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
