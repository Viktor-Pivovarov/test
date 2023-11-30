import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class SelectionCandidatesScreen extends StatelessWidget {
  const SelectionCandidatesScreen({
    required this.timer,
    required this.offers,
    required this.onRefresh,
    super.key,
    this.onPressedFilter,
    this.onFinishTimer,
    this.onPressedOffer,
    this.onPressedAlgorithm,
  });

  final List<OfferListItemEntity> offers;

  final Duration timer;

  final VoidCallback? onPressedFilter;

  final VoidCallback? onPressedAlgorithm;

  final VoidCallback? onFinishTimer;

  final void Function(int id)? onPressedOffer;

  final Future<void> Function() onRefresh;

  List<OfferListItemEntity> get noAnswerOffers =>
      offers.where((element) => element.noAnswerDatingState).toList();

  List<OfferListItemEntity> get hasAnswerOffers =>
      offers.where((element) => !element.noAnswerDatingState).toList();

  @override
  Widget build(BuildContext context) {
    return UiRefreshScaffold(
      onRefresh: onRefresh,
      useLayoutBuilder: true,
      appBar: UiAppBar(
        title: noAnswerOffers.isEmpty
            ? Text(SelectionI18n.searchingTitle)
            : AppBarCandidates(
                items: [
                  ...noAnswerOffers.map((e) => e.candidate).toList().reversed,
                ],
              ),
        actions: [
          IconButton(
            onPressed: onPressedFilter,
            icon: UiIcon(Assets.icons.iFilter),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (noAnswerOffers.isEmpty)
            UiSelectionActiveCard(timer: timer, onFinish: onFinishTimer),
          if (noAnswerOffers.isNotEmpty)
            UiSelectionOfferCard(
              offer: noAnswerOffers.first,
              onPressedOffer: onPressedOffer,
            ),
          ...hasAnswerOffers.map((offer) {
            return CandidateCard(
              avatar: NetworkImage(offer.candidate.photos.first),
              age: CoreI18n.age(offer.candidate.age),
              score: offer.compatibility.value.toInt(),
              type: offer.datingState!.toCandidateCardType(),
              onPressed: () {
                onPressedOffer?.call(offer.id);
              },
              status: SelectionI18n.datingStatus(offer.datingState!),
              name: offer.candidate.name,
            );
          }),
        ],
      ),
    );
  }
}
