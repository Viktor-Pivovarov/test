import 'package:flutter/material.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class CoupleDetailCard extends StatelessWidget {
  const CoupleDetailCard({
    required this.marriedYear,
    required this.children,
    super.key,
  });

  final int marriedYear;

  final int children;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: context.color.logoGradient,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Insets.s),
                    child: UiIcon(
                      Assets.icons.iRing,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: Insets.m,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${MenuI18n.married}:',
                      style: context.text.mainText
                          .copyWith(color: context.color.smallTextColor),
                    ),
                    Text(
                      marriedYear.toString(),
                      style: context.text.mainTextMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: context.color.logoGradient,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Insets.s),
                    child: UiIcon(
                      Assets.icons.pacifier1,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: Insets.m,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${MenuI18n.children}:',
                      style: context.text.mainText
                          .copyWith(color: context.color.smallTextColor),
                    ),
                    Text(
                      children.toString(),
                      style: context.text.mainTextMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
