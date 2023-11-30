part of 'review_cubit.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState({
    @Default(StateStatus.pure) StateStatus status,
    @Default([]) List<DictModel> reasons,
    FormGroup? form,
    String? error,
  }) = _ReviewState;

  const ReviewState._();
}
