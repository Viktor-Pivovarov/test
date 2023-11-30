import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiDeleteRoundButton extends StatelessWidget {
  const UiDeleteRoundButton({
    super.key,
    this.disabled = false,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    this.asset,
  });

  final bool disabled;

  final VoidCallback? onPressed;

  final EdgeInsets padding;

  final String? asset;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(
          color: context.colors.content.base,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Insets.xxxl),
        child: Material(
          color: context.colors.bg.secondary,
          child: InkWell(
            onTap: !disabled ? onPressed : null,
            child: Container(
              padding: padding,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: getIcon(),
            ),
          ),
        ),
      ),
    );
  }

  UiIcon getIcon() => asset != null
      ? UiIcon(asset!)
      : UiIcon(
          AssetsNew.icons.dsCrossSmall.path,
          width: 14,
          height: 14,
        );
}
