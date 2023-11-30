part of 'birthday_date_cubit.dart';

@freezed
class BirthdayDateState with _$BirthdayDateState {
  const factory BirthdayDateState.initial({
    required DateTime date,
    @Default(StateStatus.pure) StateStatus status,
    @Default(true) bool isEditing,
    @Default(false) bool isValid,
    @Default(true) bool disabled,
    AuthenticatedUser? user,
  }) = _Initial;

  const BirthdayDateState._();
}
