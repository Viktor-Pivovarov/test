import 'package:freezed_annotation/freezed_annotation.dart';

part 'supporting_model.freezed.dart';
part 'supporting_model.g.dart';

@freezed
class SupportingModel with _$SupportingModel {
  const factory SupportingModel({
    required String email,
    required String message,
  }) = _SupportingModel;

  factory SupportingModel.fromJson(Object? json) =>
      _$SupportingModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
