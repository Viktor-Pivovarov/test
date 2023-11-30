import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiRatingCard extends StatelessWidget {
  const UiRatingCard({
    required this.title,
    required this.text,
    required this.count,
    required this.maxCount,
    super.key,
    this.onPressed,
  });

  final String title;
  final String text;
  final VoidCallback? onPressed;
  final double count;
  final int maxCount;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      title: title,
      text: text,
      onPressed: onPressed,
      suffixIcon: Row(
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <InlineSpan>[
                TextSpan(
                  text: '$count',
                  style: Theme.of(context)
                      .extension<TextExtension>()!
                      .numbers
                      .copyWith(
                        fontSize: 28,
                        color: Theme.of(context)
                            .extension<ThemeColors>()!
                            .mainAccentColor,
                      ),
                ),
                TextSpan(
                  text: '/$maxCount',
                  style: Theme.of(context)
                      .extension<TextExtension>()!
                      .numbers
                      .copyWith(
                        color: Theme.of(context)
                            .extension<ThemeColors>()!
                            .textColor,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Insets.l),
            child: CrossPlatformSvg.asset(
              Assets.icons.iChevronRight,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}
