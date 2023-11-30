import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@Deprecated('Use UiIconedButton!')
class UiIconButton extends StatelessWidget {
  const UiIconButton(
    this.icon, {
    super.key,
    this.color,
    this.onPressed,
  });

  final String icon;

  final Color? color;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return UiCircleButton(
      onPressed: onPressed,
      fillColor: color ?? Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(Insets.m),
      child: UiIcon(
        icon,
        width: Insets.xl,
        height: Insets.xl,
        color: Colors.white,
      ),
    );
  }
}
