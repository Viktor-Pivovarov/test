import 'package:freezed_annotation/freezed_annotation.dart';

part 'dict_model.freezed.dart';
part 'dict_model.g.dart';

@freezed
class DictModel with _$DictModel {
  const factory DictModel({
    required int id,
    required String name,
    String? code,
  }) = _DictModel;

  factory DictModel.fromJson(Map<String, dynamic> json) =>
      _$DictModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
