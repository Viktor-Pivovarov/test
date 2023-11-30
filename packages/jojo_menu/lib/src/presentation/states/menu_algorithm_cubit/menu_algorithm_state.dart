part of 'menu_algorithm_cubit.dart';

@freezed
class MenuAlgorithmState with _$MenuAlgorithmState {
  const factory MenuAlgorithmState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
  }) = _MenuAlgrotihmState;

  factory MenuAlgorithmState.fromJson(Object? json) =>
      _$MenuAlgorithmStateFromJson(json! as Map<String, dynamic>);

  const MenuAlgorithmState._();

  @override
  Map<String, dynamic> toJson();
}
