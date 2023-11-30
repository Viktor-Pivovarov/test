import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class FreezeAccountWidget extends StatelessWidget {
  const FreezeAccountWidget({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        useColor: true,
        title: Text(
          MenuI18n.freezeAccountTitle,
          style: context.text.mainTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: Insets.l,
          right: Insets.l,
          top: Insets.xxl,
          bottom: Insets.bottomNavBar,
        ),
        child: Column(
          children: [
            Text(
              MenuI18n.accountWillBeFrozen,
              textAlign: TextAlign.center,
              style: context.text.bigTitle,
            ),
            const SizedBox(
              height: Insets.l,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.m),
              child: Text(
                MenuI18n.accountWillBeFrozenDescription,
                textAlign: TextAlign.center,
                style: context.text.mainText
                    .copyWith(color: context.color.smallTextColor),
              ),
            ),
            Expanded(child: UiImage(Assets.images.door)),
            UiButton.outline(
              text: MenuI18n.freezeAccountTitle,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
