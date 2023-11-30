import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class RatingBlock extends StatelessWidget {
  const RatingBlock(this.rating, {super.key, this.size = 180});

  final double size;

  final double rating;

  double get value => (rating * 100 / 32) / 100;

  @override
  Widget build(BuildContext context) {
    Color ratingColor = Theme.of(context).colorScheme.error;

    if (rating >= 18 && rating <= 24) {
      ratingColor = Theme.of(context).iconTheme.color!;
    }

    if (rating >= 25) {
      ratingColor = const Color(0xff27AE60);
    }

    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        width: size,
        height: size,
        constraints: BoxConstraints(maxWidth: size, maxHeight: size),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: CrossAssetImage(Assets.images.mandalaFull),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(Insets.l * 2),
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(context.color.green),
              ),
            ),
            Text(
              rating.toInt().toString(),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: ratingColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
