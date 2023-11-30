part of 'selection_search_params_cubit.dart';

@freezed
class SelectionSearchParamsState with _$SelectionSearchParamsState {
  const factory SelectionSearchParamsState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    @Default(SearchPreferencesDTO()) SearchPreferencesDTO params,
  }) = _Initial;
}

class BaseState {
  BaseState({this.status = StateStatus.pure});

  final StateStatus status;
}
