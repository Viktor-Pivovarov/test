import 'package:freezed_annotation/freezed_annotation.dart';

part 'bonus_model.freezed.dart';
part 'bonus_model.g.dart';

@freezed
class BonusModel with _$BonusModel {
  const factory BonusModel({
    required BonusType type,
    required bool enabled,
    required bool completed,
  }) = _BonusModel;

  factory BonusModel.fromJson(Object? json) =>
      _$BonusModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}

enum BonusType { completeProfile, review, giftDate }
