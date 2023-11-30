import 'package:flutter/material.dart';

import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiTitle extends StatelessWidget {
  const UiTitle(
    this.text, {
    super.key,
    this.fontSize,
    this.height,
    this.padding,
    this.fontWeight,
  });

  final String? text;

  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: Insets.l),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: fontSize,
              height: height,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}
