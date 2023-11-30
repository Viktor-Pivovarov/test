import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_menu/src/presentation/widgets/review_dialog.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'menu_free_dates_cubit.freezed.dart';
part 'menu_free_dates_state.dart';

class MenuFreeDatesCubit extends BaseCubit<MenuFreeDatesState> {
  MenuFreeDatesCubit({
    required GetBonusesUseCase getBonusesUseCase,
    required MenuRouter router,
  })  : _getBonusesUseCase = getBonusesUseCase,
        _router = router,
        super(const MenuFreeDatesState()) {
    fetch();
  }

  final GetBonusesUseCase _getBonusesUseCase;

  final MenuRouter _router;

  Future<void> fetch() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final result = await _getBonusesUseCase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: failure.getLocalizedString(),
        ),
      ),
      (bonuses) => emit(
        state.copyWith(
          status: StateStatus.fetchingSuccess,
          unCompletedBonuses:
              bonuses.where((element) => !element.completed).toList(),
          completedBonuses:
              bonuses.where((element) => element.completed).toList(),
        ),
      ),
    );
  }

  Future<void> onPressedTask(
    BonusModel bonusModel,
    BuildContext context,
  ) async {
    switch (bonusModel.type) {
      case BonusType.completeProfile:
        _router.goToProfile();
      case BonusType.review:
        final result = await showGeneralDialog<bool>(
          context: context,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return const ReviewDialog();
          },
        );

        if (result ?? false) {
          unawaited(const BonusDialog().show());
          unawaited(fetch());
        }
      case BonusType.giftDate:
      // TODO: Handle this case.
    }
  }
}
