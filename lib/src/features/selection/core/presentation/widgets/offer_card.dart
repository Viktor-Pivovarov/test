import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiSelectionOfferCard extends StatelessWidget {
  const UiSelectionOfferCard({
    required this.offer,
    super.key,
    this.onPressedOffer,
  });

  final OfferListItemEntity offer;

  final void Function(int id)? onPressedOffer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OfferCubit>(
      create: (context) => SelectionInjection.sl<OfferCubit>(),
      child: BlocBuilder<OfferCubit, OfferState>(
        builder: (context, state) {
          return UiCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () => onPressedOffer?.call(offer.id),
                      child: UiPhotoSlider(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(BorderRadiusInsets.l),
                          topRight: Radius.circular(BorderRadiusInsets.l),
                        ),
                        photos: offer.candidate.photos,
                        padding: EdgeInsets.zero,
                        bottomContent: Padding(
                          padding: const EdgeInsets.only(top: Insets.s),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UiIconButton(
                                Assets.icons.iCross,
                                onPressed: state.status.isFetchingInProgress
                                    ? null
                                    : () => context
                                        .read<OfferCubit>()
                                        .onPressedDecline(offer.id),
                              ),
                              Text(
                                SelectionI18n.moreDetails.toUpperCase(),
                                style: context.text.smallText.copyWith(
                                  color: context.color.fillBgColor,
                                ),
                              ),
                              UiIconButton(
                                Assets.icons.iHeart,
                                color: context.color.green,
                                onPressed: state.status.isFetchingInProgress
                                    ? null
                                    : () => context
                                        .read<OfferCubit>()
                                        .onPressedAccept(offer.id),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: Insets.l,
                      top: Insets.l,
                      child: UiOfferStatus(status: offer.datingState),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: Insets.l),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: Insets.xs,
                                  ),
                                  child: UiIcon(
                                    Assets.icons.iMap,
                                    width: Insets.s,
                                    color: context.color.smallTextColor,
                                  ),
                                ),
                                Text(
                                  SelectionI18n.distance(offer.distance),
                                  style: context.text.smallText,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: Insets.xs,
                                    ),
                                    child: Text(
                                      '${offer.candidate.name},',
                                      style: context.text.mainTitle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: Insets.xs,
                                      ),
                                      child: Text(
                                        '${offer.candidate.age}',
                                        style: context.text.mainTitle,
                                      ),
                                    ),
                                    UiIcon(
                                      Assets.icons.iParkSolidProtect,
                                      useColor: false,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 96,
                          height: 64,
                          child: Opacity(
                            opacity: 0.5,
                            child: UiImage(
                              Assets.images.mandala,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  offer.compatibility.value.toInt().toString(),
                                  style: context.text.mainText.copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 20 / 24,
                                    fontSize: 24,
                                    color: context.color.calculateScoreColor(
                                      offer.compatibility.value.toInt(),
                                      context,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: Insets.xs,
                                    right: Insets.s,
                                  ),
                                  child: Text(
                                    '/36',
                                    style: context.text.mainText.copyWith(
                                      fontWeight: FontWeight.w300,
                                      height: 24 / 14,
                                      fontSize: 12,
                                      color: context.color.smallTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
