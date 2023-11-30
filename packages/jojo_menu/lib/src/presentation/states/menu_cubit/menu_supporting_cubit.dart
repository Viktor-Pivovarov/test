import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'menu_supporting_cubit.freezed.dart';
part 'menu_supporting_cubit.g.dart';
part 'menu_supporting_state.dart';

class MenuSupportingCubit extends BaseCubit<MenuSupportingState> {
  MenuSupportingCubit({
    required GetFaqUseCase getFaqUseCase,
    required SubscribeFaqUseCase subscribeFaqUseCase,
    required MenuRouter router,
  })  : _getFaqUseCase = getFaqUseCase,
        _subscribeFaqUseCase = subscribeFaqUseCase,
        _router = router,
        super(const MenuSupportingState()) {
    subscribe();
    init();
  }

  final GetFaqUseCase _getFaqUseCase;
  final SubscribeFaqUseCase _subscribeFaqUseCase;
  final MenuRouter _router;

  Stream<FaqModel>? faqStream;
  StreamSubscription<FaqModel>? subscription;

  Future<void> init() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));
    final result = await _getFaqUseCase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: failure.getLocalizedString(),
        ),
      ),
      (_) => state.copyWith(
        status: StateStatus.fetchingSuccess,
      ),
    );
  }

  Future<void> subscribe() async {
    faqStream = await _subscribeFaqUseCase(NoParams());

    subscription = faqStream?.listen(_onUpdate);
  }

  void _onUpdate(FaqModel faq) {
    emit(state.copyWith(faq: faq));
  }

  Future<void> onSupportingPressed(BuildContext context) async {
    final result = await _router.goToSupportingForm();
    if (result ?? false) {
      if (context.mounted) {
        await AutoRouter.of(context).pop();
      }
    }
  }

  @override
  Future<void> close() async {
    await super.close();
    await subscription?.cancel();
  }
}
