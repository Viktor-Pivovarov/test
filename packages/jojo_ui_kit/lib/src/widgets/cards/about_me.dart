import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiAboutMeCard extends StatelessWidget {
  const UiAboutMeCard({
    required this.title,
    required this.text,
    super.key,
    this.onPressed,
  });

  final String title;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      title: title,
      text: text,
      onPressed: onPressed,
      suffixIcon: onPressed != null
          ? CrossPlatformSvg.asset(
              Assets.icons.iChevronRight,
              color: Theme.of(context).iconTheme.color,
            )
          : null,
    );
  }
}
