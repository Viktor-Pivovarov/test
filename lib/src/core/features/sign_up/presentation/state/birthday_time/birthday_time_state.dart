part of 'birthday_time_cubit.dart';

@freezed
class BirthdayTimeState with _$BirthdayTimeState {
  const factory BirthdayTimeState.initial({
    required DateTime date,
    @Default(StateStatus.pure) StateStatus status,
    @Default('1') String knowBirthdayTime,
    @Default(true) bool isEditing,
    @Default(false) bool isValid,
    @Default(false) bool isSelectedTime,
    @Default(true) bool disabled,
    @Default(false) bool isSelectedDoNotKnown,
    AuthenticatedUser? user,
  }) = _Initial;

  const BirthdayTimeState._();
}
