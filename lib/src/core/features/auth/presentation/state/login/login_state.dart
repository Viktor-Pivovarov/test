part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
  }) = _LoginInitialState;

  factory LoginState.fromJson(Object? json) =>
      _$LoginStateFromJson(json! as Map<String, dynamic>);

  const LoginState._();

  @override
  Map<String, dynamic> toJson();
}
