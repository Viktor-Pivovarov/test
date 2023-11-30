part of 'menu_settings_cubit.dart';

@freezed
class MenuSettingsState with _$MenuSettingsState {
  const factory MenuSettingsState.initial({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
  }) = _MenuInitialState;

  factory MenuSettingsState.fromJson(Object? json) =>
      _$MenuSettingsStateFromJson(json! as Map<String, dynamic>);

  const MenuSettingsState._();

  @override
  Map<String, dynamic> toJson();
}
