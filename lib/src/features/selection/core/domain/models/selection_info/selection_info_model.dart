import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/selection/_selection.dart';

part 'selection_info_model.freezed.dart';
part 'selection_info_model.g.dart';

@freezed
class SelectionInfoDTO with _$SelectionInfoDTO {
  const factory SelectionInfoDTO({
    @JsonKey(name: 'datingDisplay') required DatingDisplayState datingState,
    DateTime? nextOfferTime,
    String? waitingCandidatesMessage,
  }) = _SelectionInfoDTO;

  const SelectionInfoDTO._();

  factory SelectionInfoDTO.fromJson(Object? json) =>
      _$SelectionInfoDTOFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();

  Duration get timer => nextOfferTime != null
      ? nextOfferTime!.difference(DateTime.now())
      : Duration.zero;
}
