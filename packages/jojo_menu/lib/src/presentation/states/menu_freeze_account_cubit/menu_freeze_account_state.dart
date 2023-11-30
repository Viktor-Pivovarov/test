part of 'menu_freeze_account_cubit.dart';

@freezed
class MenuFreezeAccountState with _$MenuFreezeAccountState {
  const factory MenuFreezeAccountState({
    @Default(StateStatus.pure) StateStatus status,
    @Default(false) bool isFreezed,
    String? error,
  }) = _MenuFreezeAccountState;

  factory MenuFreezeAccountState.fromJson(Object? json) =>
      _$MenuFreezeAccountStateFromJson(json! as Map<String, dynamic>);

  const MenuFreezeAccountState._();

  @override
  Map<String, dynamic> toJson();
}
