import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    this.title = '',
    this.text = '',
    this.prefixIconAsset,
    this.suffixImageAsset,
    this.prefixIconColor,
    this.prefixIconEmoji,
    super.key,
    this.onPressed,
  });

  final String title;
  final String text;

  final String? prefixIconAsset;
  final String? suffixImageAsset;

  final VoidCallback? onPressed;

  final Color? prefixIconColor;

  final String? prefixIconEmoji;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      prefixIcon: prefixIconAsset != null
          ? UiIcon(
              prefixIconAsset ?? Assets.icons.iGift,
              color: prefixIconColor,
            )
          : Text(
              prefixIconEmoji ?? '',
              style: context.text.mainTitle,
            ),
      suffixIcon: Row(
        children: [
          if (suffixImageAsset != null)
            UiImage(
              suffixImageAsset ?? Assets.images.wallet,
              width: 64,
              height: 64,
            ),
          CrossPlatformSvg.asset(
            Assets.icons.iChevronRight,
            color: context.color.smallTextColor,
          ),
        ],
      ),
      padding:
          const EdgeInsets.symmetric(vertical: Insets.s, horizontal: Insets.m),
      onPressed: onPressed,
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.text.mainTitleMedium,
                ),
                if (text.isNotEmpty)
                  Text(
                    text,
                    style: context.text.smallText
                        .copyWith(color: context.color.smallTextColor),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
