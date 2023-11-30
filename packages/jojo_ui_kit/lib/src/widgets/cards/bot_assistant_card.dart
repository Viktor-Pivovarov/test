import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class BotAssistantCard extends StatelessWidget {
  const BotAssistantCard({
    required this.title,
    required this.text,
    required this.icon,
    required this.color,
    super.key,
    this.onPressed,
  });
  final String title;
  final String text;
  final VoidCallback? onPressed;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      onPressed: onPressed,
      padding: const EdgeInsets.fromLTRB(Insets.l, Insets.l, 0, Insets.l),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: Insets.s / 2),
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .extension<TextExtension>()!
                        .smallTitle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Insets.s / 2),
                  child: Text(
                    text,
                    style:
                        Theme.of(context).extension<TextExtension>()!.smallText,
                  ),
                ),
              ],
            ),
          ),
          PulseIndicator(
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(Insets.l),
              child: Container(
                padding: const EdgeInsets.all(Insets.l),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                ),
                child: CrossImage(icon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
