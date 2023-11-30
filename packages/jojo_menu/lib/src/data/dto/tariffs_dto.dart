import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';

part 'tariffs_dto.freezed.dart';
part 'tariffs_dto.g.dart';

@freezed
class TariffsDto with _$TariffsDto {
  const factory TariffsDto({
    required List<TariffModel> items,
  }) = _TariffsDto;

  factory TariffsDto.fromJson(Object? json) =>
      _$TariffsDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
