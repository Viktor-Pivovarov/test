part of 'offer_cubit.dart';

@freezed
class OfferState with _$OfferState {
  const factory OfferState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    OfferEntity? offer,
    @Default([]) List<DictModel> complainReasons,
  }) = _Initial;
}
