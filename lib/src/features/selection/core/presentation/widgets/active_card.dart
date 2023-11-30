import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiSelectionActiveCard extends StatelessWidget {
  const UiSelectionActiveCard({
    required this.timer,
    super.key,
    this.onFinish,
  });

  final Duration timer;

  final VoidCallback? onFinish;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UiCard(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: Insets.l, bottom: Insets.l),
                child: Align(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: PulseIndicator(
                      child: UiImage(Assets.media.selection),
                    ),
                  ),
                ),
              ),
              Text(
                SelectionI18n.nextSelection,
                style: context.text.mainTitle,
                textAlign: TextAlign.center,
              ),
              SearchTimer(duration: timer, onFinish: onFinish),
            ],
          ),
        ),
      ],
    );
  }
}
