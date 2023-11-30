import 'package:freezed_annotation/freezed_annotation.dart';

part 'tariff_model.freezed.dart';
part 'tariff_model.g.dart';

@freezed
class TariffModel with _$TariffModel {
  const factory TariffModel({
    required int id,
    required String title,
    required String mode,
    required String type,
    required String quantity,
    required String age,
    required int discount,
    required double cost,
    required double pricePerMeet,
    required String status,
    required String sticker,
    required String cover,
  }) = _TariffModel;

  factory TariffModel.fromJson(Object? json) =>
      _$TariffModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
