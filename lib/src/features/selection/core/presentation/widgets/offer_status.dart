import 'package:flutter/cupertino.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiOfferStatus extends StatelessWidget {
  const UiOfferStatus({this.status, super.key});

  final OfferStatus? status;

  @override
  Widget build(BuildContext context) {
    if (status == null) {
      return const SizedBox();
    }

    Color stateColor = context.color.fillBgColor;
    Color textColor = context.color.textColor;

    if (status == OfferStatus.youAreLiked) {
      stateColor = context.color.green;
      textColor = context.color.fillBgColor;
    }

    if (status == OfferStatus.mutualAttraction) {
      textColor = context.color.fillBgColor;
    }

    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: Insets.m, vertical: Insets.s),
      decoration: BoxDecoration(
        color: stateColor,
        gradient: status == OfferStatus.mutualAttraction
            ? context.color.logoGradient
            : null,
        border: Border.all(color: context.color.fillBgColor, width: 2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: Insets.s),
            child: Text(
              SelectionI18n.datingStatus(status!),
              style: context.text.ultraSmallText.copyWith(color: textColor),
            ),
          ),
          if (status == OfferStatus.waitingForCandidate)
            const CupertinoActivityIndicator(radius: 6),
          if (status == OfferStatus.youAreLiked)
            UiIcon(
              Assets.icons.iHeart,
              color: textColor,
              width: Insets.l,
            ),
          if (status == OfferStatus.mutualAttraction)
            UiIcon(
              Assets.icons.iHeartFilled,
              color: textColor,
              width: Insets.l,
            ),
        ],
      ),
    );
  }
}
