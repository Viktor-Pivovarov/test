import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'menu_algorithm_cubit.freezed.dart';
part 'menu_algorithm_cubit.g.dart';
part 'menu_algorithm_state.dart';

class MenuAlgorithmCubit extends BaseCubit<MenuAlgorithmState> {
  MenuAlgorithmCubit() : super(const MenuAlgorithmState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(status: StateStatus.fetchingSuccess));
  }
}
