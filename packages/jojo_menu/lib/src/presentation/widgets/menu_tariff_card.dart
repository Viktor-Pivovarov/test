import 'package:flutter/cupertino.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class MenuTariffCard extends StatelessWidget {
  const MenuTariffCard({
    this.title = '',
    this.text = '',
    super.key,
    this.onPressed,
  });

  final String title;
  final String text;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      padding: const EdgeInsets.only(
        left: Insets.l,
        right: Insets.l,
      ),
      onPressed: onPressed,
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Insets.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.text.mainTitleMedium,
                  ),
                  const SizedBox(
                    height: Insets.xs,
                  ),
                  Text(
                    text,
                    style: context.text.smallText
                        .copyWith(color: context.color.smallTextColor),
                  ),
                ],
              ),
            ),
          ),
          UiImage(
            Assets.images.wallet,
            width: 72,
            height: 72,
          ),
          Padding(
            padding: const EdgeInsets.only(top: Insets.xl),
            child: CrossPlatformSvg.asset(
              Assets.icons.iChevronRight,
              color: context.color.smallTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
