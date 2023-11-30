// ignore_for_file: no_default_cases

import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'menu_freeze_account_cubit.freezed.dart';
part 'menu_freeze_account_cubit.g.dart';
part 'menu_freeze_account_state.dart';

class MenuFreezeAccountCubit extends BaseCubit<MenuFreezeAccountState> {
  MenuFreezeAccountCubit({
    required GetAccountStatusUseCase getAccountStatusUseCase,
    required UnfreezeAccountUseCase unfreezeAccountUseCase,
    required FreezeAccountUseCase freezeAccountUseCase,
    required VerifyAccountStatusUseCase verifyAccountStatusUseCase,
    required MenuRouter menuRouter,
  })  : _getAccountStatusUseCase = getAccountStatusUseCase,
        _unfreezeAccountUseCase = unfreezeAccountUseCase,
        _freezeAccountUseCase = freezeAccountUseCase,
        _verifyAccountStatusUseCase = verifyAccountStatusUseCase,
        _router = menuRouter,
        super(const MenuFreezeAccountState()) {
    subscribe();
  }

  final GetAccountStatusUseCase _getAccountStatusUseCase;

  final UnfreezeAccountUseCase _unfreezeAccountUseCase;

  final FreezeAccountUseCase _freezeAccountUseCase;

  final VerifyAccountStatusUseCase _verifyAccountStatusUseCase;

  final MenuRouter _router;

  Stream<ProfileStatus>? profileStatusStream;
  StreamSubscription<ProfileStatus>? subscription;

  Future<void> subscribe() async {
    profileStatusStream = await _getAccountStatusUseCase(NoParams());

    subscription = profileStatusStream?.listen(_onUpdate);
  }

  void _onUpdate(ProfileStatus status) {
    switch (status) {
      case ProfileStatus.frozen:
        emit(state.copyWith(isFreezed: true));

      default:
        emit(state.copyWith(isFreezed: false));
    }
  }

  Future<void> onPressedFreeze() async {
    final result = await _freezeAccountUseCase.call(NoParams());

    result.fold(
      (failure) => null,
      (success) {
        _router.goToSelection();
        _verifyAccountStatusUseCase.call(NoParams());
      },
    );
  }

  Future<void> onPressedUnfreeze() async {
    final result = await _unfreezeAccountUseCase.call(NoParams());

    result.fold((failure) => null, (success) {
      _router.goToSelection();
      _verifyAccountStatusUseCase.call(NoParams());
    });
  }

  @override
  Future<void> close() async {
    await super.close();
    await subscription?.cancel();
  }
}
