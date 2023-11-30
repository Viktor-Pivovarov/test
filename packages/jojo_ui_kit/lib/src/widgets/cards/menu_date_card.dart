import 'package:flutter/cupertino.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class MenuDateCard extends StatelessWidget {
  const MenuDateCard({
    this.title = '',
    this.text = '',
    this.count = 0,
    this.isLoading = false,
    super.key,
    this.onPressed,
  });

  final String title;
  final String text;
  final int count;
  final bool isLoading;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      padding:
          const EdgeInsets.symmetric(vertical: Insets.s, horizontal: Insets.l),
      onPressed: onPressed,
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.text.mainTitleMedium,
              ),
              Text(
                text,
                style: context.text.smallText
                    .copyWith(color: context.color.smallTextColor),
              ),
            ],
          ),
          if (isLoading) const CupertinoActivityIndicator(radius: Insets.s),
          if (!isLoading)
            Text(
              count.toString(),
              textAlign: TextAlign.center,
              style: context.text.mainText.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 32,
                height: 40 / 32,
                color: count > 0
                    ? context.color.green
                    : context.color.mainAccentColor,
              ),
            ),
        ],
      ),
    );
  }
}
