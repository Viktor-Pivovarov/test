import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'response_dict_model.freezed.dart';
part 'response_dict_model.g.dart';

@freezed
class ResponseDictModel with _$ResponseDictModel {
  const factory ResponseDictModel({
    @Default(<DictModel>[]) List<DictModel> items,
  }) = _ResponseDictModel;

  factory ResponseDictModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseDictModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
class ResponseInterestModel with _$ResponseInterestModel {
  const factory ResponseInterestModel({
    @Default(<InterestModel>[]) List<InterestModel> items,
  }) = _ResponseInterestModel;

  factory ResponseInterestModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseInterestModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
