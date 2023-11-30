import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class CoupleCard extends StatelessWidget {
  const CoupleCard({
    this.score = 0,
    super.key,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      padding: const EdgeInsets.only(left: Insets.xl),
      child: Row(
        children: [
          Expanded(
            child: Text(
              MenuI18n.astrologicalCompatibility,
              style: context.text.smallTitleMedium,
            ),
          ),
          Stack(
            children: [
              SizedBox(
                width: 96,
                height: 96,
                child: Opacity(
                  opacity: 0.5,
                  child: UiImage(
                    Assets.images.mandala,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        score.toString(),
                        style: context.text.mainText.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 20 / 24,
                          fontSize: 24,
                          color: calculateScoreColor(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: Insets.xs,
                          right: Insets.s,
                        ),
                        child: Text(
                          '/36',
                          style: context.text.mainText.copyWith(
                            fontWeight: FontWeight.w300,
                            height: 24 / 14,
                            fontSize: 12,
                            color: context.color.smallTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color calculateScoreColor(BuildContext context) {
    if (score < 18) {
      return context.color.mainAccentColor;
    }
    if (score >= 18 && score <= 24) {
      return context.color.smallTextColor;
    }

    return context.color.green;
  }
}
