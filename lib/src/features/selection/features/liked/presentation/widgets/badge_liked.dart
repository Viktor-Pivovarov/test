import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class BadgeLiked extends StatelessWidget {
  const BadgeLiked({
    required this.text,
    required this.fontSize,
    required this.height,
    this.padding,
    this.color,
    this.icon,
    this.textColor,
    this.gradient,
    this.border,
    super.key,
  });

  final String text;
  final double fontSize;
  final double height;
  final Color? color;
  final UiIcon? icon;
  final Color? textColor;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        border: border,
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: Insets.s,
            ),
        child: Row(
          children: [
            Text(
              text,
              style: context.texts.caption.mark.copyWith(
                color: textColor ?? context.colors.content.inverse,
                height: 1,
              ),
            ),
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(left: Insets.s),
                child: icon,
              ),
          ],
        ),
      ),
    );
  }
}
