import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required String tokenType,
    required String accessToken,
    required String expiresIn,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Object? json) =>
      _$AuthResponseModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
