import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/selection/_selection.dart';

part 'offer_list_item_entity.freezed.dart';
part 'offer_list_item_entity.g.dart';

@freezed
class OfferListItemEntity with _$OfferListItemEntity {
  const factory OfferListItemEntity({
    required int id,
    required CandidateListItemEntity candidate,
    required OfferEntityCompatibility compatibility,
    required num distance,
    OfferStatus? datingState,
    @Default(false) bool isNew,
  }) = _OfferListItemEntity;

  factory OfferListItemEntity.fromJson(Object? json) =>
      _$OfferListItemEntityFromJson(json! as Map<String, dynamic>);

  const OfferListItemEntity._();

  @override
  Map<String, dynamic> toJson();

  bool get noAnswerDatingState =>
      datingState == null || datingState == OfferStatus.youAreLiked;
}
