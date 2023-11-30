import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'menu_delete_account_cubit.freezed.dart';
part 'menu_delete_account_state.dart';

class MenuDeleteAccountCubit extends BaseCubit<MenuDeleteAccountState> {
  MenuDeleteAccountCubit({
    required GetReasonsForDeletionUseCase getReasonsForDeletionUseCase,
    required VerifyAccountStatusUseCase verifyAccountStatusUseCase,
    required DeleteAccountUseCase deleteAccountUseCase,
    required MenuRouter menuRouter,
  })  : _getReasonsForDeletion = getReasonsForDeletionUseCase,
        _deleteAccountUseCase = deleteAccountUseCase,
        _verifyAccountStatusUseCase = verifyAccountStatusUseCase,
        _router = menuRouter,
        super(
          const MenuDeleteAccountState(
            status: StateStatus.fetchingInProgress,
          ),
        );

  final GetReasonsForDeletionUseCase _getReasonsForDeletion;

  final VerifyAccountStatusUseCase _verifyAccountStatusUseCase;

  final DeleteAccountUseCase _deleteAccountUseCase;

  final MenuRouter _router;

  FormGroup? form;

  bool processed = false;

  Future<void> init() async {
    final result = await _getReasonsForDeletion(NoParams());

    result.fold(
        (failure) => emit(state.copyWith(status: StateStatus.fetchingFailure)),
        (reasons) {
      form = FormGroup(
        {
          for (final element in reasons)
            element.id.toString(): FormControl<bool>(value: false),
        },
      );
      emit(
        state.copyWith(
          status: StateStatus.fetchingSuccess,
          reasons: reasons,
          form: form,
        ),
      );
    });
  }

  Future<void> onSubmitDeleteAccount() async {
    if (!processed) {
      processed = true;
      final reasons = form?.value.entries
              .where((element) => element.value == true)
              .map(
                (e) => DictModel(
                  id: int.tryParse(e.key) ?? 1,
                  name: state.reasons
                      .firstWhere(
                        (element) => element.id == (int.tryParse(e.key) ?? 1),
                      )
                      .name,
                ),
              )
              .toList() ??
          [];

      final result = await _deleteAccountUseCase(reasons);

      await result.fold((failure) => null, (success) async {
        await const AccountDeletedDialog().show();
        await _verifyAccountStatusUseCase(NoParams());
      });
      processed = false;
    }
  }

  void onPressedFreezeAccount() {
    _router.replaceNamed(MenuRoutePath.freezeAccount);
  }

  void onPressedDeleteAccount() {
    _router.replaceNamed(MenuRoutePath.deleteAccountConfirm);
  }
}
