import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiSelectionNoOffersCard extends StatelessWidget {
  const UiSelectionNoOffersCard({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return UiCard.white(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: Insets.l, bottom: Insets.l),
                child: Align(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: PulseIndicator(
                      child: UiImage(Assets.media.selectionSearch),
                    ),
                  ),
                ),
              ),
              Text(
                SelectionI18n.noOffers,
                style: context.text.mainTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          UiButton(
            text: SelectionI18n.aboutAlgorithm,
            onPressed: onPressed,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
