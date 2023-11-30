part of 'menu_statistics_cubit.dart';

@freezed
class MenuStatisticsState with _$MenuStatisticsState {
  const factory MenuStatisticsState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    DatingInfoModel? datingInfoModel,
  }) = _MenuStatisticsState;

  factory MenuStatisticsState.fromJson(Object? json) =>
      _$MenuStatisticsStateFromJson(json! as Map<String, dynamic>);

  const MenuStatisticsState._();

  @override
  Map<String, dynamic> toJson();
}
