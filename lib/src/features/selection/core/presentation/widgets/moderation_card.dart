import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiSelectionModerationCard extends StatelessWidget {
  const UiSelectionModerationCard({
    required this.timer,
    super.key,
    this.onPressed,
    this.onFinishTimer,
  });

  final VoidCallback? onPressed;

  final VoidCallback? onFinishTimer;

  final Duration timer;

  @override
  Widget build(BuildContext context) {
    return UiCard.white(
      padding: const EdgeInsets.all(Insets.l),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Insets.l, bottom: Insets.l),
            child: Align(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                child: PulseIndicator(child: UiImage(Assets.media.selection)),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                SelectionI18n.firstSelection,
                style: context.text.mainTitle,
                textAlign: TextAlign.center,
              ),
              SearchTimer(duration: timer, onFinish: onFinishTimer),
              Padding(
                padding: const EdgeInsets.only(bottom: Insets.xxl),
                child: Text(
                  SelectionI18n.fillProfileDescription,
                  textAlign: TextAlign.center,
                  style: context.text.smallText
                      .copyWith(color: context.color.smallTextColor),
                ),
              ),
              UiButton(
                text: SelectionI18n.fillProfileBtn,
                onPressed: onPressed,
                padding: EdgeInsets.zero,
                suffixIcon: UiIcon(Assets.icons.iGift),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
