import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/selection/_selection.dart';

part 'offers_response_dto.freezed.dart';
part 'offers_response_dto.g.dart';

@freezed
class OffersResponseDTO with _$OffersResponseDTO {
  const factory OffersResponseDTO({
    @Default([]) List<OfferListItemEntity> items,
  }) = _OffersResponseDTO;

  factory OffersResponseDTO.fromJson(Object? json) =>
      _$OffersResponseDTOFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
