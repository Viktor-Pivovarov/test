import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'menu_statistics_cubit.freezed.dart';
part 'menu_statistics_cubit.g.dart';
part 'menu_statistics_state.dart';

class MenuStatisticsCubit extends BaseCubit<MenuStatisticsState> {
  MenuStatisticsCubit({
    required GetDatingInfoUseCase getDatingInfoUseCase,
    required SubscribeDatingInfoUseCase subscribeDatingInfoUseCase,
    required this.authManager,
  })  : _getDatingInfoUseCase = getDatingInfoUseCase,
        _subscribeDatingInfoUseCase = subscribeDatingInfoUseCase,
        super(const MenuStatisticsState()) {
    subscribe();
    init();
  }

  final GetDatingInfoUseCase _getDatingInfoUseCase;
  final SubscribeDatingInfoUseCase _subscribeDatingInfoUseCase;

  final AuthManager<AuthenticatedUser> authManager;

  Stream<DatingInfoModel?>? datingInfoStream;
  StreamSubscription<DatingInfoModel?>? subscription;

  Future<void> init() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));
    final result = await _getDatingInfoUseCase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: failure.getLocalizedString(),
        ),
      ),
      (_) => state.copyWith(
        status: StateStatus.fetchingSuccess,
      ),
    );
  }

  Future<void> subscribe() async {
    datingInfoStream = await _subscribeDatingInfoUseCase(NoParams());

    subscription = datingInfoStream?.listen(_onUpdate);
  }

  void _onUpdate(DatingInfoModel? datingInfoModel) {
    emit(state.copyWith(datingInfoModel: datingInfoModel));
  }

  @override
  Future<void> close() async {
    await super.close();
    await subscription?.cancel();
  }
}
