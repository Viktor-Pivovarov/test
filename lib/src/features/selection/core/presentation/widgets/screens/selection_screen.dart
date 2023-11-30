// import 'package:flutter/material.dart';
// import 'package:jojo/src/features/selection/core/_core.dart';
// import 'package:jojo_sdk/jojo_sdk.dart';
// import 'package:jojo_ui_kit/jojo_ui_kit.dart';

// class SelectionScreen extends StatelessWidget {
//   const SelectionScreen({
//     required this.timer,
//     required this.offers,
//     required this.onRefresh,
//     required this.state,
//     super.key,
//     this.onPressedFilter,
//     this.onFinishTimer,
//     this.onPressedOffer,
//     this.onPressedAlgorithm,
//   });
//   final DatingDisplayState state;

//   final List<OfferListItemEntity> offers;

//   final Duration timer;

//   final VoidCallback? onPressedFilter;

//   final VoidCallback? onPressedAlgorithm;

//   final VoidCallback? onFinishTimer;

//   final void Function(int id)? onPressedOffer;

//   final Future<void> Function() onRefresh;

//   List<OfferListItemEntity> get noAnswerOffers =>
//       offers.where((element) => element.noAnswerDatingState).toList();

//   List<OfferListItemEntity> get hasAnswerOffers =>
//       offers.where((element) => !element.noAnswerDatingState).toList();

//   @override
//   Widget build(BuildContext context) {
//     return UiRefreshScaffold(
//       onRefresh: onRefresh,
//       useLayoutBuilder: true,
//       appBar: _buildAppBar(),
//       child: _buildBody(),
//     );
//   }

//   PreferredSizeWidget _buildAppBar() {
//     return UiAppBar(
//       title: state.isNoCandidatesFound
//           ? Text(SelectionI18n.searchingTitle)
//           : AppBarCandidates(
//               items: [
//                 ...noAnswerOffers.map((e) => e.candidate).toList().reversed,
//               ],
//             ),
//       actions: [
//         IconButton(
//           onPressed: onPressedFilter,
//           icon: UiIcon(Assets.icons.iFilter),
//         ),
//       ],
//     );
//   }

//   Widget _buildBody() {
//     if (timer.inSeconds == 0 && offers.isEmpty) {
//       return UiSelectionNoOffersCard(onPressed: onPressedAlgorithm);
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (state.isNoCandidatesFound)
//           UiSelectionActiveCard(timer: timer, onFinish: onFinishTimer),
//         if (noAnswerOffers.isNotEmpty)
//           UiSelectionOfferCard(
//             offer: noAnswerOffers.first,
//             onPressedOffer: onPressedOffer,
//           ),
//         ...hasAnswerOffers.map((offer) {
//           return CandidateCard(
//             avatar: NetworkImage(offer.candidate.photos.first),
//             age: CoreI18n.age(offer.candidate.age),
//             score: offer.candidate.score.toInt(),
//             type: offer.datingState!.toCandidateCardType(),
//             onPressed: () {
//               onPressedOffer?.call(offer.id);
//             },
//             status: SelectionI18n.datingStatus(offer.datingState!),
//             name: offer.candidate.name,
//           );
//         }),
//       ],
//     );
//   }
// }
