import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiAboutMeInfoCard extends StatelessWidget {
  const UiAboutMeInfoCard({
    required this.title,
    required this.text,
    super.key,
    this.onPressed,
    this.hasError = false,
  });

  final String title;
  final String text;
  final VoidCallback? onPressed;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: Insets.s),
                child: Text(
                  title,
                  style: context.text.mainTitle,
                ),
              ),
              if (hasError)
                const AttentionIcon(
                  padding: EdgeInsets.only(left: Insets.s, top: Insets.xs),
                  useBorder: false,
                  size: 15,
                ),
              if (!hasError && onPressed != null)
                UiIcon(
                  Assets.icons.iEdit,
                  color: Theme.of(context).primaryColor,
                ),
              const Expanded(child: SizedBox.shrink()),
              if (onPressed != null)
                Padding(
                  padding: const EdgeInsets.only(top: Insets.s),
                  child: CrossPlatformSvg.asset(
                    Assets.icons.iChevronRight,
                    color: context.color.smallTextColor,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: Insets.xs),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    text,
                    style: context.text.smallText.copyWith(
                      color: hasError
                          ? context.color.mainAccentColor
                          : context.color.smallTextColor,
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
