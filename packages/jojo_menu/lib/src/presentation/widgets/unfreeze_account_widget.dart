import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UnFreezeAccountWidget extends StatelessWidget {
  const UnFreezeAccountWidget({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        useColor: true,
        title: Text(
          MenuI18n.accountFrozen,
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
            const Expanded(child: SizedBox.shrink()),
            SizedBox(
              width: 95,
              height: 95,
              child: Stack(
                children: [
                  Align(
                    child: UIShadow.button(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: context.color.logoGradient,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: UiIcon(
                        Assets.icons.pause,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.xl),
              child: Text(
                MenuI18n.selectionTemporarilyStopped,
                textAlign: TextAlign.center,
                style: context.text.mainTitle,
              ),
            ),
            const SizedBox(
              height: Insets.l,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.xxl),
              child: Text(
                MenuI18n.selectionTemporarilyStoppedDescription,
                textAlign: TextAlign.center,
                style: context.text.mainText
                    .copyWith(color: context.color.smallTextColor),
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            UiButton(
              text: MenuI18n.unfreezeAccount,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
