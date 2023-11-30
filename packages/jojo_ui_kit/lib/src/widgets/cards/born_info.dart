import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiBornInfoCard extends StatelessWidget {
  const UiBornInfoCard({
    required this.title,
    required this.zodiacTitle,
    required this.zodiac,
    required this.age,
    this.onPressed,
    super.key,
  });

  final String title;
  final String age;
  final String zodiacTitle;
  final String zodiac;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      onPressed: onPressed,
      suffixIcon: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: Insets.s),
            child: Text(zodiacTitle,
                style: Theme.of(context)
                    .extension<TextExtension>()!
                    .mainTextMedium
                    .copyWith(
                        color: Theme.of(context)
                            .extension<ThemeColors>()!
                            .mainAccentColor,),),
          ),
          CrossPlatformSvg.asset(
            Assets.zodiacsIcons.zodiac(zodiac),
            color: Theme.of(context).extension<ThemeColors>()!.mainAccentColor,
            width: Insets.xxl,
          ),
          Padding(
            padding: const EdgeInsets.only(left: Insets.l),
            child: CrossPlatformSvg.asset(
              Assets.icons.iChevronRight,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.s / 2),
            child: Text(title,
                style: Theme.of(context).extension<TextExtension>()!.smallText,),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.s / 2),
            child: Text(age,
                style: Theme.of(context).extension<TextExtension>()!.mainTitle,),
          ),
        ],
      ),
    );
  }
}
