part of 'languages_cubit.dart';

@freezed
class LanguagesState with _$LanguagesState {
  const factory LanguagesState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    @Default([]) List<DictModel> languages,
    @Default('en') String deviceLocale,
    String? searchValue,
  }) = _LanguagesInitialState;

  factory LanguagesState.fromJson(Object? json) =>
      _$LanguagesStateFromJson(json! as Map<String, dynamic>);

  const LanguagesState._();

  @override
  Map<String, dynamic> toJson();
}
