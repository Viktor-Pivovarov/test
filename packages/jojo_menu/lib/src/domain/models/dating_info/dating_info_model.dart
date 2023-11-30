import 'package:freezed_annotation/freezed_annotation.dart';

part 'dating_info_model.freezed.dart';

part 'dating_info_model.g.dart';

@freezed
class DatingInfoModel with _$DatingInfoModel {
  const factory DatingInfoModel({
    required int balance,
    required int totalCandidates,
    required int youLiked,
    required int mutualSympathy,
    required int youSaidNo,
    @Default(0) int newLikesMe,
    @Default(0) int likesMe,
  }) = _DatingInfoModel;

  factory DatingInfoModel.fromJson(Object? json) =>
      _$DatingInfoModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
