import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class RatingCarouselItem extends StatelessWidget {
  const RatingCarouselItem({
    required this.color,
    required this.title,
    required this.description,
    super.key,
  });

  final Color color;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Insets.s / 2),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
        ),
        borderRadius: BorderRadius.circular(BorderRadiusInsets.l),
      ),
      child: UiCard(
        margin: EdgeInsets.zero,
        title: title,
        child: Padding(
          padding: const EdgeInsets.only(top: Insets.l),
          child: Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
