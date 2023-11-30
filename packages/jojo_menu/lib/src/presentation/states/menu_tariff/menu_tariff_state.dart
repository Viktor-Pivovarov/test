part of 'menu_tariff_cubit.dart';

@freezed
class MenuTariffState with _$MenuTariffState {
  const factory MenuTariffState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    @Default([]) List<TariffModel> tariffs,
  }) = _MenuTariffState;

  factory MenuTariffState.fromJson(Object? json) =>
      _$MenuTariffStateFromJson(json! as Map<String, dynamic>);

  const MenuTariffState._();

  List<TariffModel> get onlyTariffs {
    final result = tariffs.where((element) => element.type == 'tariff').toList()
      ..sort(
        (a, b) => (int.tryParse(b.quantity) ?? 0)
            .compareTo(int.tryParse(a.quantity) ?? 0),
      );
    return result;
  }

  @override
  Map<String, dynamic> toJson();
}
