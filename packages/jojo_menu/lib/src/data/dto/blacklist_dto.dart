import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_menu/jojo_menu.dart';

part 'blacklist_dto.freezed.dart';
part 'blacklist_dto.g.dart';

@freezed
class BlacklistDto with _$BlacklistDto {
  const factory BlacklistDto({
    required List<CandidateModel> items,
  }) = _BlacklistDto;

  factory BlacklistDto.fromJson(Object? json) =>
      _$BlacklistDtoFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
