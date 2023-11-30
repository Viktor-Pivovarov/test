part of 'menu_free_dates_cubit.dart';

@freezed
class MenuFreeDatesState with _$MenuFreeDatesState {
  const factory MenuFreeDatesState({
    @Default(StateStatus.pure) StateStatus status,
    @Default([]) List<BonusModel> unCompletedBonuses,
    @Default([]) List<BonusModel> completedBonuses,
    String? error,
  }) = _MenuFreeDatesState;

  const MenuFreeDatesState._();
}
