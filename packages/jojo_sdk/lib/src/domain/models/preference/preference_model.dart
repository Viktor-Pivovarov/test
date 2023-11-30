import 'package:freezed_annotation/freezed_annotation.dart';

part 'preference_model.freezed.dart';
part 'preference_model.g.dart';

@freezed
class PreferenceModel with _$PreferenceModel {
  const factory PreferenceModel({
    int? ageFrom,
    int? ageTo,
    int? heightFrom,
    int? heightTo,
  }) = _PreferenceModel;

  factory PreferenceModel.fromJson(Object? json) =>
      _$PreferenceModelFromJson(json! as Map<String, dynamic>);

  const PreferenceModel._();

  @override
  Map<String, dynamic> toJson();
}
