import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

part 'menu_cubit.freezed.dart';
part 'menu_cubit.g.dart';
part 'menu_state.dart';

class MenuCubit extends BaseCubit<MenuState> {
  MenuCubit({
    required GetDatingInfoUseCase getDatingInfoUseCase,
    required MenuRouter router,
  })  : _getDatingInfoUseCase = getDatingInfoUseCase,
        _router = router,
        super(const MenuState.initial()) {
    init();
  }

  final GetDatingInfoUseCase _getDatingInfoUseCase;

  final MenuRouter _router;

  final StreamController<SwipeRefreshState> _controller =
      StreamController<SwipeRefreshState>.broadcast();

  final maxInterests = 9;

  Stream<SwipeRefreshState> get refreshStream => _controller.stream;

  Future<void> init() async {
    await getMenu();
  }

  Future<void> getMenu() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));
  }

  Future<void> onRefresh() async {
    await _getDatingInfoUseCase(NoParams());
    _controller.sink.add(SwipeRefreshState.hidden);
  }

  void onPressedAbout() {
    _router.goToAbout();
  }

  void onPressedSupporting() {
    _router.goToSupport();
  }

  void onPressedSettings() {
    _router.goToSettings();
  }

  void onPressedTariffs() {
    _router.goToTariffs();
  }

  void onPressedFreeDates() {
    _router.goToFreeDates();
  }

  void onPressedStatistics() {
    _router.goToStatistics();
  }

  void onPressedAlgorithm() {
    _router.goToAlgorithm();
  }

  void onPressedActivateHints() {}
}
