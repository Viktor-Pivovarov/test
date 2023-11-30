import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'menu_notification_cubit.freezed.dart';
part 'menu_notification_state.dart';

class MenuNotificationCubit extends BaseCubit<MenuNotificationState> {
  MenuNotificationCubit(
    GetUserSettingsUseCase getUserSettingsUseCase,
    SetNotificationMutualSympathyOfferUseCase
        setNotificationMutualSympathyOfferUseCase,
    SetNotificationNewChatMessagesUseCase setNotificationNewChatMessagesUseCase,
    SetNotificationNewStackOffer setNotificationNewStackOffer,
  )   : _getUserSettingsUseCase = getUserSettingsUseCase,
        _setNotificationMutualSympathyOfferUseCase =
            setNotificationMutualSympathyOfferUseCase,
        _setNotificationNewChatMessagesUseCase =
            setNotificationNewChatMessagesUseCase,
        _setNotificationNewStackOffer = setNotificationNewStackOffer,
        super(const MenuNotificationState()) {
    fetch();
  }

  final GetUserSettingsUseCase _getUserSettingsUseCase;
  final SetNotificationMutualSympathyOfferUseCase
      _setNotificationMutualSympathyOfferUseCase;
  final SetNotificationNewChatMessagesUseCase
      _setNotificationNewChatMessagesUseCase;
  final SetNotificationNewStackOffer _setNotificationNewStackOffer;

  final FormGroup form = FormGroup({
    MenuNotificationState.newSelectionFormKey: FormControl<bool>(),
    MenuNotificationState.mutualSympathy: FormControl<bool>(),
    MenuNotificationState.chat: FormControl<bool>(),
  });

  Future<void> fetch() async {
    emit(
      state.copyWith(
        status: StateStatus.fetchingSuccess,
      ),
    );

    final result = await _getUserSettingsUseCase(NoParams());
    result.fold(
      (failure) => state.copyWith(
        status: StateStatus.fetchingFailure,
      ),
      (settings) {
        (form.control(MenuNotificationState.newSelectionFormKey)
                as FormControl<bool>)
            .value = settings.allowNotificationNewStackOffer;
        (form.control(MenuNotificationState.mutualSympathy)
                as FormControl<bool>)
            .value = settings.allowNotificationMutualSympathyOffer;

        (form.control(MenuNotificationState.chat) as FormControl<bool>).value =
            settings.allowNotificationNewChatMessage;

        emit(state.copyWith(status: StateStatus.fetchingSuccess, form: form));
      },
    );
  }

  Future<void> onTapNewSelection() async {
    (form.control(MenuNotificationState.newSelectionFormKey)
            as FormControl<bool>)
        .value = !((form.control(MenuNotificationState.newSelectionFormKey)
                as FormControl<bool>)
            .value ??
        false);

    final result = await _setNotificationNewStackOffer(NoParams());

    result.fold(
      (l) => (form.control(MenuNotificationState.newSelectionFormKey)
              as FormControl<bool>)
          .value = !((form.control(MenuNotificationState.newSelectionFormKey)
                  as FormControl<bool>)
              .value ??
          false),
      (r) => null,
    );
  }

  Future<void> onTapMutualSympathy() async {
    (form.control(MenuNotificationState.mutualSympathy) as FormControl<bool>)
        .value = !((form.control(MenuNotificationState.mutualSympathy)
                as FormControl<bool>)
            .value ??
        false);

    final result = await _setNotificationMutualSympathyOfferUseCase(NoParams());

    result.fold(
      (l) => (form.control(MenuNotificationState.mutualSympathy)
              as FormControl<bool>)
          .value = !((form.control(MenuNotificationState.mutualSympathy)
                  as FormControl<bool>)
              .value ??
          false),
      (r) => null,
    );
  }

  Future<void> onTapChat() async {
    (form.control(MenuNotificationState.chat) as FormControl<bool>).value =
        !((form.control(MenuNotificationState.chat) as FormControl<bool>)
                .value ??
            false);

    final result = await _setNotificationNewChatMessagesUseCase(NoParams());

    result.fold(
      (l) => (form.control(MenuNotificationState.chat) as FormControl<bool>)
              .value =
          !((form.control(MenuNotificationState.chat) as FormControl<bool>)
                  .value ??
              false),
      (r) => null,
    );
  }
}
