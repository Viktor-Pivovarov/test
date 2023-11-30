part of 'supporting_cubit.dart';

@freezed
sealed class SupportingState with _$SupportingState {
  const factory SupportingState.loading() = SupportingStateLoading;

  const factory SupportingState.loaded({required FormGroup formGroup}) =
      SupportingStateLoaded;

  const factory SupportingState.error({
    required FormGroup formGroup,
    @Default('') String error,
  }) = SupportingStateError;

  const factory SupportingState.sended({required FormGroup formGroup}) =
      SupportingStateSended;
}
