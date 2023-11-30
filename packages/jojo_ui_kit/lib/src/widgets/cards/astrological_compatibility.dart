import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiAstrologicalCompatibilityCard extends StatelessWidget {
  const UiAstrologicalCompatibilityCard({
    required this.title,
    required this.count,
    required this.maxCount,
    this.onPressed,
    super.key,
  });

  final String title;
  final int count;
  final int maxCount;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    Color ratingColor = Theme.of(context).colorScheme.error;

    if (count >= 18 && count <= 24) {
      ratingColor = Theme.of(context).iconTheme.color!;
    }

    if (count >= 25) {
      ratingColor = const Color(0xff27AE60);
    }

    return UiCard(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      suffixIcon: Container(
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.centerLeft,
            fit: BoxFit.cover,
            // TODO deprecated
            // image: CrossAssetImage(''),
            image: CrossAssetImage(Assets.images.mandala),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: Insets.l),
          child: Row(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(right: Insets.l, left: Insets.l * 3),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: count.toString(),
                        style: TextStyle(
                          color: ratingColor,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: '/$maxCount',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // TODO deprecated
              // CrossImage(Assets.icons.keyboardArrowRight),
            ],
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: Insets.l),
        child: Text(
          title,
          style: context.text.smallTitle,
        ),
      ),
    );
  }
}
