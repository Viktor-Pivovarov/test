import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'selection_cubit.freezed.dart';
part 'selection_state.dart';

class SelectionCubit extends BaseCubit<SelectionState> {
  SelectionCubit({
    required SelectionRepository repository,
    required SelectionRouter router,
    required EventBus eventBus,
  })  : _repository = repository,
        _router = router,
        _eventBus = eventBus,
        super(const SelectionState());

  final SelectionRepository _repository;

  final SelectionRouter _router;

  final EventBus _eventBus;

  StreamSubscription<OfferAcceptedEvent>? _acceptSubscription;

  StreamSubscription<OfferDeclinedEvent>? _declineSubscription;

  Future<void> init() async {
    _acceptSubscription = _eventBus.on<OfferAcceptedEvent>().listen((event) {
      getOffers();
      getSelection();
    });

    _declineSubscription = _eventBus.on<OfferDeclinedEvent>().listen((event) {
      getOffers();
      getSelection();
    });

    await getOffers();
    await getSelection();

    emit(state.copyWith(isFirstLoading: false));
  }

  Future<void> onRefresh() async {
    await getOffers();
    await getSelection();
  }

  Future<void> getOffers() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final result = await _repository.getOffers();

    result.fold((error) {
      emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: error.getLocalizedString(),
        ),
      );
    }, (response) {
      emit(
        state.copyWith(
          offers: response,
          status: StateStatus.fetchingSuccess,
        ),
      );
    });
  }

  Future<void> showMenu() async {
    await DialogService.showFullscreenDialog<dynamic>(
      dialog: UiSystemInfoDialog(
        child: ListView(
          padding: const EdgeInsets.all(Insets.l),
          children: [
            Text('datingState: ${state.selectionInfo.datingState.name}'),
            Text('nextOfferTime: ${state.selectionInfo.nextOfferTime}'),
            Text(
              'waitingCandidatesMessage: ${state.selectionInfo.waitingCandidatesMessage}',
            ),
            Text(
              'offers datingState: \n${state.offers.map((e) => 'id: ${e.id}, datingState: ${e.datingState}').join('\n')}',
            ),
          ],
        ),
      ),
    );
  }

  void onFinishTimer() {
    init();
  }

  void onPressedFilter() {
    _router.goToSearchParams();
  }

  void onPressedAlgorithm() {
    _router.goToMenuAlgorithm();
  }

  void onPressedOffer(int id) {
    _router.goToCandidate(id);
  }

  void onPressedChat() {
    _router.navigateNamed('/main/${ChatRoutePath.chat}');
  }

  void onPressedProfile() {
    _router.navigateNamed('/main/${ProfileRoutePath.profile}');
  }

  Future<void> getSelection() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final result = await _repository.getSelection();

    result.fold((error) {
      emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: error.getLocalizedString(),
        ),
      );
    }, (response) {
      emit(
        state.copyWith(
          selectionInfo: response,
          status: StateStatus.fetchingSuccess,
        ),
      );
    });
  }

  @override
  Future<void> close() async {
    await _acceptSubscription?.cancel();
    await _declineSubscription?.cancel();

    await super.close();
  }
}
