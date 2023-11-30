import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_city.freezed.dart';
part 'user_city.g.dart';

@freezed
class UserCity with _$UserCity {
  const factory UserCity({
    required int id,
    required String name,
    required String price,
  }) = _UserCity;

  factory UserCity.fromJson(Map<String, dynamic> json) =>
      _$UserCityFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
