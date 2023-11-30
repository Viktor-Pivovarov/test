import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiDivider extends StatelessWidget {
  const UiDivider({
    super.key,
    this.margin,
    this.useLogo = true,
  });

  final EdgeInsetsGeometry? margin;
  final bool useLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: Insets.l),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 1,
              color: context.colors.content.tertiary,
            ),
          ),
          if (useLogo)
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: Insets.l / 2,
              ),
              child: CrossPlatformSvg.asset(Assets.icons.iDivider),
            ),
          Expanded(
            child: Container(
              height: 1,
              color: context.colors.content.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
