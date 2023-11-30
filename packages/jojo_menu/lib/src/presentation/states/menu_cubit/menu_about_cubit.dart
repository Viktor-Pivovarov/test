import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'menu_about_cubit.freezed.dart';
part 'menu_about_cubit.g.dart';
part 'menu_about_state.dart';

class MenuAboutCubit extends BaseCubit<MenuAboutState> {
  MenuAboutCubit({
    required GetAppInfoUseCase getAppInfoUseCase,
    required GetThirdPartyLinksUseCase getThirdPartyLinksUseCase,
    required SubscribeThirdPartyLinksUseCase subscribeThirdPartyLinksUseCase,
    required MenuRouter router,
  })  : _getAppInfoUseCase = getAppInfoUseCase,
        _getThirdPartyLinksUseCase = getThirdPartyLinksUseCase,
        _subscribeThirdPartyLinksUseCase = subscribeThirdPartyLinksUseCase,
        _router = router,
        super(const MenuAboutState()) {
    subscribe();
    init();
  }

  final GetAppInfoUseCase _getAppInfoUseCase;

  final GetThirdPartyLinksUseCase _getThirdPartyLinksUseCase;

  final SubscribeThirdPartyLinksUseCase _subscribeThirdPartyLinksUseCase;

  Stream<List<ThirdPartyLinkModel>>? linksStream;
  StreamSubscription<List<ThirdPartyLinkModel>>? subscription;

  final MenuRouter _router;

  Future<void> init() async {
    await _getThirdPartyLinksUseCase(NoParams());
    final appInfo = await _getAppInfoUseCase(NoParams());

    appInfo.fold(
      (failure) => emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: failure.message,
        ),
      ),
      (result) => emit(
        state.copyWith(status: StateStatus.fetchingSuccess, appInfo: result),
      ),
    );
  }

  Future<void> subscribe() async {
    linksStream = await _subscribeThirdPartyLinksUseCase(NoParams());

    subscription = linksStream?.listen(_onUpdate);
  }

  void _onUpdate(List<ThirdPartyLinkModel> links) {
    emit(state.copyWith(links: links));
  }

  void onPressedTermsOfUse() {
    _router.gotToTermsOfUse();
  }

  void onPressedPersonalData() {
    _router.goToPersonalDataProcessing();
  }

  void onPressedPrivacyPolicy() {
    _router.goToPrivacyPolicy();
  }

  @override
  Future<void> close() async {
    await super.close();
    await subscription?.cancel();
  }
}
