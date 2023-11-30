part of 'menu_supporting_cubit.dart';

@freezed
class MenuSupportingState with _$MenuSupportingState {
  const factory MenuSupportingState({
    @Default(StateStatus.pure) StateStatus status,
    @Default(FaqModel(items: [])) FaqModel faq,
    String? error,
  }) = _MenuSupportingState;

  factory MenuSupportingState.fromJson(Object? json) =>
      _$MenuSupportingStateFromJson(json! as Map<String, dynamic>);

  const MenuSupportingState._();

  @override
  Map<String, dynamic> toJson();
}
