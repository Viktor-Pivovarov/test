import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_model.freezed.dart';
part 'selection_model.g.dart';

@freezed
class SelectionModel with _$SelectionModel {
  const factory SelectionModel({
    required String title,    
  }) = _SelectionModel;

  factory SelectionModel.fromJson(Object? json) =>
      _$SelectionModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
