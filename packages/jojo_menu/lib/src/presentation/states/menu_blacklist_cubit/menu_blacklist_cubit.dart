import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'menu_blacklist_cubit.freezed.dart';
part 'menu_blacklist_cubit.g.dart';
part 'menu_blacklist_state.dart';

class MenuBlacklistCubit extends BaseCubit<MenuBlacklistState> {
  MenuBlacklistCubit({
    required GetBlacklistUseCase getBlacklistUseCase,
    required UnblockUserUseCase unblockUserUseCase,
  })  : _getBlacklistUseCase = getBlacklistUseCase,
        _unblockUserUseCase = unblockUserUseCase,
        super(const MenuBlacklistState()) {
    fetch();
  }

  final GetBlacklistUseCase _getBlacklistUseCase;
  final UnblockUserUseCase _unblockUserUseCase;

  Future<void> fetch() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final result = await _getBlacklistUseCase(NoParams());

    result.fold(
      (failure) => null,
      (blacklist) => emit(
        state.copyWith(
          status: StateStatus.fetchingSuccess,
          candidates: blacklist,
        ),
      ),
    );
  }

  Future<void> onPressedUnblock(
    CandidateModel candidateModel,
  ) async {
    final result = await _unblockUserUseCase(candidateModel.userId);
    await result.fold((failure) => null, (success) async {
      await fetch();
      await const UserUnlockedDialog().show();
    });
  }
}
