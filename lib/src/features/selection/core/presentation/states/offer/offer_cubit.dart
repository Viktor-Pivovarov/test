import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo/src/features/selection/core/presentation/widgets/complain_dialog.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'offer_state.dart';
part 'offer_cubit.freezed.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit({
    required SelectionRepository repository,
    required DictRepository dictRepository,
    required SelectionRouter router,
    required EventBus eventBus,
  })  : _repository = repository,
        _dictRepository = dictRepository,
        _router = router,
        _eventBus = eventBus,
        super(const OfferState());

  final DictRepository _dictRepository;

  final SelectionRepository _repository;

  final SelectionRouter _router;

  final EventBus _eventBus;

  Future<void> init(int id) async {
    final result = await _repository.getOffer(id);

    result.fold((l) {
      emit(state.copyWith(status: StateStatus.fetchingFailure));
    }, (r) {
      emit(state.copyWith(offer: r, status: StateStatus.fetchingSuccess));
    });

    final dictResult = await _dictRepository.getComplainReasons();

    dictResult.fold((l) => null, (r) {
      emit(state.copyWith(complainReasons: r));
    });
  }

  Future<void> onPressedAccept(int id) async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final result = await _repository.acceptOffer(id);

    result.fold((l) {
      emit(state.copyWith(status: StateStatus.fetchingFailure));
    }, (r) {
      init(id);
      _eventBus.fire(OfferAcceptedEvent(id: id));
    });
  }

  Future<void> onPressedDecline(int id) async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final result = await _repository.declineOffer(id);

    result.fold((l) {
      emit(state.copyWith(status: StateStatus.fetchingFailure));
    }, (r) {
      init(id);

      _eventBus.fire(OfferDeclinedEvent(id: id));
    });
  }

  void onPressedAstrologicalCompatibility() {
    _router.goToCompatibility(state.offer!.id);
  }

  Future<void> onPressedPhoto(int index) async {
    final dialog = DialogTypes.photo(
      photos: state.offer!.candidate.photos,
      selected: index,
    );

    await dialog.show();
  }

  Future<void> onPressedBlock([List<int>? reasons]) async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final result = await _repository.block(state.offer!.id, reasons);

    result.fold((l) => null, (r) {
      emit(state.copyWith(status: StateStatus.finish));
    });
  }

  Future<void> onPressedComplainAndBlock() async {
    final result = await DialogService.showPositionedDialog<List<int>?>(
      dialog: ComplainDialog(
        complainReasons: state.complainReasons,
        name: state.offer?.candidate.name,
      ),
      position: EasyDialogPosition.bottom,
      decoration: EasyDialogDecoration.combine([
        EasyDialogDismiss.swipe(
          willDismiss: () => true,
          direction: DismissDirection.down,
        ),
        const EasyDialogAnimation.fadeBackground(
          backgroundColor: Colors.black45,
        ),
        const EasyDialogAnimation.fade(),
      ]),
    );

    if (result != null) {
      await onPressedBlock(result);
    }
  }
}
