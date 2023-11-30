part of 'search_age_cubit.dart';

@freezed
class SearchAgeState with _$SearchAgeState {
  const factory SearchAgeState.initial({
    @Default(20) int ageFrom,
    @Default(45) int ageTo,
    @Default(StateStatus.pure) StateStatus status,
    @Default(true) bool isEditing,
    @Default(false) bool isValid,
    @Default(true) bool disabled,
    AuthenticatedUser? user,
  }) = _Initial;

  const SearchAgeState._();
}
