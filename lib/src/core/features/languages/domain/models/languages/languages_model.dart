import 'package:freezed_annotation/freezed_annotation.dart';

part 'languages_model.freezed.dart';
part 'languages_model.g.dart';

@freezed
class LanguagesModel with _$LanguagesModel {
  const factory LanguagesModel({
    required String title,    
  }) = _LanguagesModel;

  factory LanguagesModel.fromJson(Object? json) =>
      _$LanguagesModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
