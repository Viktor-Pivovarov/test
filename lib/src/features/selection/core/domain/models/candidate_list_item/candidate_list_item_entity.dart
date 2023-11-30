import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidate_list_item_entity.freezed.dart';
part 'candidate_list_item_entity.g.dart';

@freezed
class CandidateListItemEntity with _$CandidateListItemEntity {
  const factory CandidateListItemEntity({
    required String name,
    required int age,
    @Default([]) List<String> photos,
  }) = _CandidateListItemEntity;

  factory CandidateListItemEntity.fromJson(Object? json) =>
      _$CandidateListItemEntityFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
