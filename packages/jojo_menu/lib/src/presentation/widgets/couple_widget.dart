import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class CoupleWidget extends StatelessWidget {
  const CoupleWidget({
    required this.title,
    required this.score,
    required this.asset,
    required this.marriedYear,
    required this.children,
    super.key,
  });

  final String title;

  final String asset;

  final int score;

  final int marriedYear;

  final int children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: context.text.mainTitleMedium,
        ),
        const SizedBox(
          height: Insets.l,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(Insets.l),
          child: UiImage(asset),
        ),
        const SizedBox(
          height: Insets.l,
        ),
        CoupleCard(
          score: score,
        ),
        CoupleDetailCard(marriedYear: marriedYear, children: children),
      ],
    );
  }
}
