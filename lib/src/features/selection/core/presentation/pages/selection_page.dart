import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

@RoutePage()
class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionCubit, SelectionState>(
      builder: (context, state) {
        final SelectionCubit _cubit = context.read<SelectionCubit>();

        if (state.status.isFetchingInProgress && state.isFirstLoading) {
          return const SelectionLoadingScreen();
        }

        switch (state.selectionInfo.datingState) {
          // switch (DatingDisplayState.noCandidatesFound) {
          // case DatingDisplayState.moderationFailed:
          //   return SelectionErrorScreen(
          //     onRefresh: _cubit.onRefresh,
          //     onPressed: _cubit.onPressedChat,
          //   );
          // case DatingDisplayState.onModeration:
          //   return SelectionModerationScreen(
          //     timer: state.selectionInfo.timer,
          //     onFinishTimer: _cubit.onFinishTimer,
          //     onRefresh: _cubit.onRefresh,
          //     onPressed: _cubit.onPressedProfile,
          //     onPressedFilter: _cubit.onPressedFilter,
          //   );
          case DatingDisplayState.noCandidatesFound:
            return SelectionNoCandidatesScreen(
              onRefresh: _cubit.onRefresh,
              onPressedFilter: _cubit.onPressedFilter,
              onPressedAlgorithm: _cubit.onPressedAlgorithm,
            );
          case DatingDisplayState.candidatesWasFound:
            return SelectionCandidatesScreen(
              onRefresh: _cubit.onRefresh,
              offers: state.offers,
              timer: state.selectionInfo.timer,
              onFinishTimer: _cubit.onFinishTimer,
              onPressedOffer: _cubit.onPressedOffer,
              onPressedFilter: _cubit.onPressedFilter,
              onPressedAlgorithm: _cubit.onPressedAlgorithm,
            );
          // case DatingDisplayState.accountFrozen:
          //   return const Scaffold(
          //     body: Center(child: Text('Аккаунт заморожен')),
          //   );
        }
      },
    );
  }
}
