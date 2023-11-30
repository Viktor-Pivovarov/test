import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';

part 'third_party_links_dto.freezed.dart';
part 'third_party_links_dto.g.dart';

@freezed
class ThirdPartyLinksDto with _$ThirdPartyLinksDto {
  const factory ThirdPartyLinksDto({
    required List<ThirdPartyLinkModel> items,
  }) = _ThirdPartyLinksDto;

  factory ThirdPartyLinksDto.fromJson(Object? json) =>
      _$ThirdPartyLinksDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
