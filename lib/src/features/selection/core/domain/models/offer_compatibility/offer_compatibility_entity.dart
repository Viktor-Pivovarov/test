import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_compatibility_entity.freezed.dart';
part 'offer_compatibility_entity.g.dart';

@freezed
class OfferEntityCompatibility with _$OfferEntityCompatibility {
  const factory OfferEntityCompatibility({
    required num value,
    required num maxValue,
  }) = _OfferEntityCompatibility;

  factory OfferEntityCompatibility.fromJson(Object? json) =>
      _$OfferEntityCompatibilityFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
