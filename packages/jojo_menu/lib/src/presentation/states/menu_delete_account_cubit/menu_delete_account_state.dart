part of 'menu_delete_account_cubit.dart';

@freezed
class MenuDeleteAccountState with _$MenuDeleteAccountState {
  const factory MenuDeleteAccountState({
    @Default(StateStatus.pure) StateStatus status,
    @Default([]) List<DictModel> reasons,
    FormGroup? form,
    String? error,
  }) = _MenuDeleteAccountState;

  const MenuDeleteAccountState._();
}
