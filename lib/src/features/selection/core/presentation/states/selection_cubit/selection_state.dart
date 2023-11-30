part of 'selection_cubit.dart';

@freezed
class SelectionState with _$SelectionState {
  const factory SelectionState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    @Default(
      SelectionInfoDTO(datingState: DatingDisplayState.candidatesWasFound),
    )
    SelectionInfoDTO selectionInfo,
    @Default([]) List<OfferListItemEntity> offers,
    @Default(true) bool isFirstLoading,
  }) = _SelectionInitialState;

  const SelectionState._();
}
