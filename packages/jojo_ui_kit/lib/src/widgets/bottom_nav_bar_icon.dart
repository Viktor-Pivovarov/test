import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class BottomNavbarIcon extends StatelessWidget {
  const BottomNavbarIcon({
    required this.icon,
    required this.onPressed,
    this.isActive = false,
    this.badge,
    super.key,
  });

  final VoidCallback onPressed;

  final bool isActive;

  final String icon;

  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UiIcon.button(
          icon,
          onPressed: onPressed,
          color: isActive
              ? context.colors.content.brand
              : context.colors.content.secondary,
        ),
        if (badge != null)
          Positioned(
            right: Insets.m,
            top: Insets.s,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: Insets.xs),
                constraints: const BoxConstraints(
                  minWidth: 18,
                  minHeight: 18,
                  maxHeight: 18,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: context.colors.content.brand,
                ),
                child: Center(
                  child: DefaultTextStyle(
                    style: context.texts.caption.mark.copyWith(height: 1),
                    child: badge ?? const SizedBox(),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
