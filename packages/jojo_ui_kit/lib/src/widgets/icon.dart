import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiIcon extends StatelessWidget {
  const UiIcon(
    this.icon, {
    super.key,
    this.color,
    this.useColor = true,
    this.width,
    this.height,
    this.padding,
  }) : _onPressed = null;

  const UiIcon.button(
    this.icon, {
    required VoidCallback? onPressed,
    super.key,
    this.color,
    this.useColor = true,
    this.width,
    this.height,
    this.padding,
  }) : _onPressed = onPressed;

  final String icon;
  final Color? color;
  final bool useColor;
  final VoidCallback? _onPressed;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    if (_onPressed != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(Insets.xxxl),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _onPressed,
            child: Container(
              padding: padding ?? const EdgeInsets.all(Insets.l),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                icon,
                package: 'jojo_ui_kit',
                width: width,
                height: height,
                colorFilter: useColor
                    ? ColorFilter.mode(
                        color ??
                            Theme.of(context).iconTheme.color ??
                            Colors.black,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
          ),
        ),
      );
    }

    return SvgPicture.asset(
      icon,
      width: width,
      height: height,
      package: 'jojo_ui_kit',
      color: useColor ? color ?? Theme.of(context).iconTheme.color : null,
    );
  }
}
