import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

part 'menu_tariff_cubit.freezed.dart';
part 'menu_tariff_cubit.g.dart';
part 'menu_tariff_state.dart';

class MenuTariffCubit extends BaseCubit<MenuTariffState> {
  MenuTariffCubit({
    required GetTariffsUseCase getTariffsUseCase,
  })  : _getTariffsUseCase = getTariffsUseCase,
        super(const MenuTariffState()) {
    init();
  }

  final GetTariffsUseCase _getTariffsUseCase;

  final StreamController<SwipeRefreshState> _controller =
      StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get refreshStream => _controller.stream;

  Future<void> init() async {
    await _getTariffs();
  }

  Future<void> _getTariffs() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));
    final result = await _getTariffsUseCase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: failure.message,
        ),
      ),
      (tariffs) => emit(
        state.copyWith(
          status: StateStatus.fetchingSuccess,
          tariffs: tariffs,
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    await _getTariffs();
    _controller.sink.add(SwipeRefreshState.hidden);
  }

  void onTapTariff(TariffModel tariff) {}
}
