import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiProfileHintCard extends StatelessWidget {
  const UiProfileHintCard({
    super.key,
    this.label = '',
    this.text = '',
    this.onPressedCard,
    this.onPressedButton,
    this.avatarName = 'JOJO',
    this.useShadow = true,
  });

  final String label;

  final String text;

  final String avatarName;

  final VoidCallback? onPressedButton;

  final VoidCallback? onPressedCard;

  final bool useShadow;

  EdgeInsetsGeometry get _margin => const EdgeInsets.only(bottom: Insets.l);

  EdgeInsetsGeometry get _padding =>
      const EdgeInsets.only(left: Insets.xl, top: Insets.m, bottom: Insets.m);

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
          onTap: onPressedCard,
          child: Padding(
            padding: _padding,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: context.text.smallTitleMedium,
                      ),
                      Text(
                        text,
                        style: context.text.smallText
                            .copyWith(color: context.color.smallTextColor),
                      ),
                      const SizedBox(
                        height: Insets.xs,
                      ),
                      Row(
                        children: [
                          UiImage(
                            Assets.images.ava1,
                            width: Insets.xl,
                            height: Insets.xl,
                          ),
                          const SizedBox(
                            width: Insets.s,
                          ),
                          Text(
                            avatarName,
                            style: context.text.ultraSmallText
                                .copyWith(color: context.color.smallTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: PulseIndicator(
                          color: const Color(0xFF2F80ED),
                          child: UiCircleButton(
                            width: 55,
                            height: 55,
                            fillColor: const Color(0xFF2F80ED),
                            onPressed: onPressedButton,
                            padding: const EdgeInsets.all(Insets.s),
                            child: UiIcon(
                              Assets.icons.iTg,
                              width: 21,
                              height: 21,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
