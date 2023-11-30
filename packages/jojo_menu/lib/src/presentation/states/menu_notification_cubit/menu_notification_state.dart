part of 'menu_notification_cubit.dart';

@freezed
class MenuNotificationState with _$MenuNotificationState {
  const factory MenuNotificationState({
    @Default(StateStatus.pure) StateStatus status,
    FormGroup? form,
  }) = _MenuNotificationState;

  const MenuNotificationState._();

  static const String newSelectionFormKey = 'newSelection';
  static const String mutualSympathy = 'mutualSympathy';
  static const String chat = 'chat';
}
