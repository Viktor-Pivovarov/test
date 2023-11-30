import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';

part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
class FaqModel with _$FaqModel {
  const factory FaqModel({
    required List<FaqItem> items,
  }) = _FaqModel;

  factory FaqModel.fromJson(Object? json) =>
      _$FaqModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
