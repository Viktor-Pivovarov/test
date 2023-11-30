import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiBottomSheet extends StatelessWidget {
  const UiBottomSheet({
    super.key,
    this.child,
    this.padding,
    this.useShadow = true,
    this.height = 108,
  });

  final Widget? child;

  final bool useShadow;

  final double? height;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(minHeight: height ?? 0),
      padding: padding ?? const EdgeInsets.all(Insets.l),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: <BoxShadow>[
          if (useShadow)
            BoxShadow(
              blurRadius: 16,
              color: Theme.of(context).shadowColor.withOpacity(0.1),
            ),
        ],
        border: !useShadow
            ? Border(
                top: BorderSide(color: context.colors.bg.secondary),
              )
            : null,
        borderRadius: useShadow
            ? const BorderRadius.only(
                topLeft: Radius.circular(Insets.l),
                topRight: Radius.circular(Insets.l),
              )
            : null,
      ),
      child: child,
    );
  }
}
