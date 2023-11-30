import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@Deprecated('Use UiRoundButton')
class UiCircleButton extends StatelessWidget {
  const UiCircleButton({
    super.key,
    this.onPressed,
    this.fillColor,
    this.splashColor,
    this.padding,
    this.child,
    this.width = 48,
    this.height = 48,
    this.borderColor = Colors.transparent,
  });

  final VoidCallback? onPressed;
  final Color? fillColor;
  final Color? splashColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double? width;
  final double? height;

  BoxConstraints get constraints {
    if (width == null && height == null) {
      return const BoxConstraints(minWidth: 88, minHeight: 36);
    }

    return BoxConstraints(
      maxWidth: width ?? 48,
      maxHeight: height ?? 48,
    );
  }

  @override
  Widget build(BuildContext context) {
    return UIShadow.button(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(48)),
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: fillColor?.withAlpha(75) ?? ThemeConfig.mainAccentShadowColor,
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
      child: RawMaterialButton(
        constraints: constraints,
        padding: padding ?? EdgeInsets.zero,
        fillColor: onPressed == null ? Colors.grey : fillColor ?? Colors.white,
        onPressed: onPressed,
        shape: CircleBorder(side: BorderSide(color: borderColor)),
        splashColor: splashColor ?? Colors.grey[50],
        highlightColor: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          width: width,
          height: height,
          child: child,
        ),
      ),
    );
  }
}
