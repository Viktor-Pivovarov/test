import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_item.freezed.dart';
part 'faq_item.g.dart';

@freezed
class FaqItem with _$FaqItem {
  const factory FaqItem({
    required String question,
    required String answer,
  }) = _FaqItem;

  factory FaqItem.fromJson(Object? json) =>
      _$FaqItemFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
