import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiTelegramButton extends StatelessWidget {
  const UiTelegramButton({
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
            backgroundColor: context.colors.button.telegram,
            shadowColor: context.effects.blueGlow.color,
            elevation: 20,
          ),
          child: Row(
            children: <Widget>[
              UiIcon(
                AssetsNew.icons.telegram.path,
                color: context.colors.text.constantWhite,
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
