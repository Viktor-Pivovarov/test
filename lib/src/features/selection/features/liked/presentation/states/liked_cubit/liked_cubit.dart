import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'liked_cubit.freezed.dart';
part 'liked_state.dart';

enum Sort { createdAt, compatibility, age }

const Map<Sort, String> sortMap = {
  Sort.createdAt: 'createdAt',
  Sort.compatibility: 'compatibility',
  Sort.age: 'age',
};

class LikedCubit extends Cubit<LikedState> {
  LikedCubit({
    required LikedRepository repository,
    required AuthManager<AuthenticatedUser> authManager,
    required SelectionRouter selectionRouter,
  })  : _repository = repository,
        _selectionRouter = selectionRouter,
        super(
          LikedState.initial(
            user: authManager.user,
          ),
        );

  final LikedRepository _repository;
  final SelectionRouter _selectionRouter;

  Future<void> init() async {
    unawaited(getDatingInfo());

    await geOffersSortBy(sortBy: sortMap[Sort.createdAt]!);
  }

  void updateIsNew(int id) {
    unawaited(_repository.updateIsNew(id));
  }

  void onPressedOffer(int id) {
    updateIsNew(id);
    _selectionRouter.goToCandidate(id);
  }

  Future<void> geOffersSortBy({
    required String sortBy,
    String? direction,
  }) async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));
    final result = await _repository.getOffers(
      sortBy: sortBy,
      direction: direction ?? 'ask',
    );

    result.fold((error) {
      emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: error.getLocalizedString(),
        ),
      );
    }, (response) {
      emit(
        state.copyWith(
          offers: response.items,
          status: StateStatus.fetchingSuccess,
        ),
      );
    });
  }

  Future<void> getDatingInfo() async {
    final result = await _repository.getDatingInfo();

    result.fold((error) {
      emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: error.getLocalizedString(),
        ),
      );
    }, (response) {
      emit(
        state.copyWith(
          datingInfo: response,
        ),
      );
    });
  }
}
