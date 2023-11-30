import 'package:freezed_annotation/freezed_annotation.dart';

part 'third_party_link_model.freezed.dart';
part 'third_party_link_model.g.dart';

@freezed
class ThirdPartyLinkModel with _$ThirdPartyLinkModel {
  const factory ThirdPartyLinkModel({
    required String code,
    required String link,
  }) = _ThirdPartyLinkModel;

  factory ThirdPartyLinkModel.fromJson(Object? json) =>
      _$ThirdPartyLinkModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
