import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiFormCompletedCard extends StatelessWidget {
  const UiFormCompletedCard({
    required this.title,
    required this.text,
    required this.progress,
    super.key,
    this.onPressed,
  });

  final String title;
  final String text;
  final int progress;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).extension<TextExtension>()!.smallTitle,
          ),
          Text(
            '$progress%',
            style: Theme.of(context).extension<TextExtension>()!.numbers,
          ),
        ],
      ),
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.s),
            child: UiProgressBar(value: progress * 0.01),
          ),
          Text(
            text,
            style: Theme.of(context)
                .extension<TextExtension>()!
                .smallText
                .copyWith(
                  color: Theme.of(context)
                      .extension<ThemeColors>()!
                      .mainAccentColor,
                ),
          ),
        ],
      ),
    );
  }
}
