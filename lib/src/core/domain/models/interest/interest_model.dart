import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'interest_model.freezed.dart';
part 'interest_model.g.dart';

@freezed
class InterestModel with _$InterestModel {
  const factory InterestModel({
    required DictModel node,
    @Default([]) List<InterestModel> items,
  }) = _InterestModel;

  factory InterestModel.fromJson(Map<String, dynamic> json) =>
      _$InterestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
