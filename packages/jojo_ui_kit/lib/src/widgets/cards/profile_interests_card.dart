import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiProfileInterestsCard extends StatelessWidget {
  const UiProfileInterestsCard({
    this.title = '',
    this.hasError = false,
    this.onPressed,
    this.items = const [],
    super.key,
    this.showBottomImage = true,
    this.hint,
  });

  final String title;

  final bool hasError;

  final VoidCallback? onPressed;

  final List<String> items;

  final bool showBottomImage;

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      padding:
          const EdgeInsets.fromLTRB(Insets.l, Insets.l, Insets.l, Insets.s),
      titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
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
                        padding: EdgeInsets.only(
                          left: Insets.s,
                          top: Insets.xs,
                        ),
                        useBorder: false,
                        size: 15,
                      ),
                    if (!hasError && onPressed != null)
                      UiIcon(
                        Assets.icons.iEdit,
                        color: Theme.of(context).primaryColor,
                      ),
                  ],
                ),
              ),
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
            padding: const EdgeInsets.only(top: Insets.s),
            child: Wrap(
              spacing: Insets.xs,
              children: items
                  .map(
                    (e) => Chip(
                      visualDensity: VisualDensity.compact,
                      side: BorderSide(
                        color: context.color.smallTextColor,
                      ),
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.all(Insets.s),
                      label: Text(
                        e,
                        style: context.text.mainTextMedium
                            .copyWith(color: context.color.smallTextColor),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          if (hint != null)
            Text(
              hint ?? '',
              style: context.text.smallText.copyWith(
                color: hasError
                    ? context.color.mainAccentColor
                    : context.color.smallTextColor,
              ),
            ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
