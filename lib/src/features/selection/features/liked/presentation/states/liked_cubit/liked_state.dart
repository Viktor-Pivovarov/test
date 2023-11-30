part of 'liked_cubit.dart';

@freezed
class LikedState with _$LikedState {
  const factory LikedState.initial({
    required AuthenticatedUser user,
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    @Default([]) List<OfferListItemEntity> offers,
    @Default(
      DatingInfoModel(
        balance: 0,
        totalCandidates: 0,
        youLiked: 0,
        mutualSympathy: 0,
        youSaidNo: 0,
      ),
    )
    DatingInfoModel datingInfo,
  }) = _LikedInitialState;
}
