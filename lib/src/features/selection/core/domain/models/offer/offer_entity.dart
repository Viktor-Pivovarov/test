import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/selection/_selection.dart';

part 'offer_entity.freezed.dart';
part 'offer_entity.g.dart';

@freezed
class OfferEntity with _$OfferEntity {
  const factory OfferEntity({
    required int id,
    required num distance,
    required OfferEntityCompatibility compatibility,
    required CandidateEntity candidate,
    OfferStatus? datingState,
  }) = _OfferEntity;

  factory OfferEntity.fromJson(Object? json) =>
      _$OfferEntityFromJson(json! as Map<String, dynamic>);

  const OfferEntity._();

  @override
  Map<String, dynamic> toJson();

  bool get noAnswerDatingState =>
      datingState == null || datingState == OfferStatus.youAreLiked;
}
