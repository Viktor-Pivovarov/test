import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
class MenuModel with _$MenuModel {
  const factory MenuModel({
    required String title,    
  }) = _MenuModel;

  factory MenuModel.fromJson(Object? json) =>
      _$MenuModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
