import 'package:freezed_annotation/freezed_annotation.dart';

part 'interest.freezed.dart';
part 'interest.g.dart';

@freezed
class Interest with _$Interest {
  const factory Interest({
    required int id,
    required String name,
    int? status,
    int? position,
  }) = _Interest;

  factory Interest.fromJson(Map<String, dynamic> json) =>
      _$InterestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
