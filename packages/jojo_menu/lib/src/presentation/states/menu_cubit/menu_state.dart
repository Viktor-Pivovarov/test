part of 'menu_cubit.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState.initial({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    MenuModel? menu,
  }) = _MenuInitialState;

  factory MenuState.fromJson(Object? json) =>
      _$MenuStateFromJson(json! as Map<String, dynamic>);

  const MenuState._();

  @override
  Map<String, dynamic> toJson();
}
