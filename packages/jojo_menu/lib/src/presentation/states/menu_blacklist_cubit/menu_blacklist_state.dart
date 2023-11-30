part of 'menu_blacklist_cubit.dart';

@freezed
class MenuBlacklistState with _$MenuBlacklistState {
  const factory MenuBlacklistState({
    @Default(StateStatus.pure) StateStatus status,
    @Default([]) List<CandidateModel> candidates,
    String? error,
  }) = _MenuBlacklistState;

  factory MenuBlacklistState.fromJson(Object? json) =>
      _$MenuBlacklistStateFromJson(json! as Map<String, dynamic>);

  const MenuBlacklistState._();

  @override
  Map<String, dynamic> toJson();
}
