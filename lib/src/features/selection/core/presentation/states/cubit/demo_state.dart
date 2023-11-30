part of 'demo_cubit.dart';

@freezed
class DemoState with _$DemoState {
  const factory DemoState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
  }) = _Initial;
}
