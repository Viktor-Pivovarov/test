import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiContextButton extends StatelessWidget {
  const UiContextButton({
    required this.icon,
    required this.label,
    super.key,
    this.disabled = false,
    this.onPressed,
    this.padding =
        const EdgeInsets.symmetric(horizontal: Insets.s, vertical: Insets.s),
    this.color,
  });

  final bool disabled;

  final VoidCallback? onPressed;

  final EdgeInsets padding;

  final UiIcon icon;

  final String label;

  final Color? color;

  static const _buttonSizeWidth = 189.0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(
          color: color ?? context.colors.content.brand,
        ),
      ),
      child: Padding(
        padding: padding,
        child: InkWell(
          onTap: disabled ? null : onPressed,
          child: Container(
            width: _buttonSizeWidth,
            padding: const EdgeInsets.all(Insets.l),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Insets.l),
              color: context.colors.bg.secondary,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                const SizedBox(
                  width: Insets.s,
                ),
                Expanded(
                  child: Text(
                    label,
                    style: context.texts.footnote.baseSemibold.copyWith(
                      color: color ?? context.colors.text.link,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
