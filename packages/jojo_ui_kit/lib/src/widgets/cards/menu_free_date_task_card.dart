import 'package:flutter/widgets.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class MenuFreeDateTaskCard extends StatelessWidget {
  const MenuFreeDateTaskCard({
    required this.index,
    required this.title,
    this.contentWidget,
    this.content = '',
    this.btnText = '',
    this.onPressed,
    this.completed = false,
    this.label = '',
    this.btnSuffixIcon,
    super.key,
  });

  final int index;
  final String title;
  final Widget? contentWidget;
  final String content;
  final String btnText;
  final VoidCallback? onPressed;
  final bool completed;
  final String label;
  final Widget? btnSuffixIcon;

  @override
  Widget build(BuildContext context) {
    if (completed) {
      return UiCard(
        titleWidget: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.s),
                color: context.color.green.withAlpha(25),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Insets.m,
                  horizontal: Insets.m,
                ),
                child: UiIcon(
                  Assets.icons.complete,
                  color: context.color.green,
                ),
              ),
            ),
            const SizedBox(
              width: Insets.m,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.text.smallText
                        .copyWith(color: context.color.green),
                  ),
                  Text(
                    title,
                    style: context.text.mainTextMedium.copyWith(
                      fontSize: 18,
                      height: 16 / 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return UiCard(
      titleWidget: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                index.toString().padLeft(2, '0'),
                style: context.text.numbers.copyWith(
                  color: context.color.mainAccentColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: Insets.m,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: Insets.xs),
                  child: Text(
                    title,
                    style: context.text.mainTitle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Insets.xs,
          ),
          if (contentWidget != null)
            contentWidget!
          else
            Text(
              content,
              style: context.text.smallText
                  .copyWith(color: context.color.smallTextColor),
            ),
          const SizedBox(
            height: Insets.xl,
          ),
          UiButton(
            text: btnText,
            onPressed: onPressed,
            suffixIcon: btnSuffixIcon,
          ),
        ],
      ),
    );
  }
}
