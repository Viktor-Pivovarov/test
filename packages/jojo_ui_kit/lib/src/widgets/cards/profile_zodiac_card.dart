import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _gradientColor1 = Color(0xFFF66919);
const _gradientColor2 = Color(0xFFF6196C);
const _gradientColor3 = Color(0xFFF6193D);

class UiProfileZodiacCard extends StatelessWidget {
  const UiProfileZodiacCard({
    required this.text,
    required this.assetZodiacIcon,
    this.label,
    this.astrologyText,
    this.useShadow = true,
    this.onPressed,
    super.key,
  });

  final String? label;
  final String text;
  final String? astrologyText;
  final String assetZodiacIcon;
  final bool useShadow;
  final VoidCallback? onPressed;

  EdgeInsetsGeometry get _margin => const EdgeInsets.only(bottom: Insets.l);

  EdgeInsetsGeometry get _padding =>
      const EdgeInsets.symmetric(horizontal: Insets.xl, vertical: Insets.m);

  BorderRadius get _borderRadius => BorderRadius.circular(Insets.l);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        boxShadow: useShadow
            ? <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).cardTheme.shadowColor ??
                      const Color.fromRGBO(115, 145, 166, 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : <BoxShadow>[],
        borderRadius: _borderRadius,
      ),
      margin: _margin,
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Insets.l),
        ),
        color: Theme.of(context).cardTheme.color,
        child: InkWell(
          splashColor:
              Theme.of(context).cardTheme.shadowColor?.withOpacity(0.1),
          highlightColor:
              Theme.of(context).cardTheme.shadowColor?.withOpacity(0.1),
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Padding(
            padding: _padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: Insets.s),
                            child: Text(
                              text,
                              style: context.text.mainTitle,
                            ),
                          ),
                          if (onPressed != null)
                            UiIcon(
                              Assets.icons.iEdit,
                              color: Theme.of(context).primaryColor,
                            ),
                        ],
                      ),
                      if (label != null)
                        Text(
                          label ?? '',
                          style: context.text.smallText
                              .copyWith(color: context.color.smallTextColor),
                        ),
                    ],
                  ),
                ),
                if (astrologyText != null)
                  Padding(
                    padding: const EdgeInsets.only(right: Insets.s),
                    child: Text(
                      astrologyText ?? '',
                      style: context.text.mainTextMedium
                          .copyWith(color: context.color.mainAccentColor),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(
                    right: onPressed != null ? Insets.l : Insets.zero,
                  ),
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          _gradientColor1,
                          _gradientColor2,
                          _gradientColor3,
                        ],
                      ).createShader(bounds);
                    },
                    child: UiIcon(
                      assetZodiacIcon,
                      color: Colors.white,
                      width: 36,
                      height: 36,
                    ),
                  ),
                ),
                if (onPressed != null) UiIcon(Assets.icons.iChevronRight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
