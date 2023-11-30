//   "token": "token123",
//   "gender": "male|female",
//   "pickupTime": "morning|evening",
//   "agreeForVedic": bool,
//   "agreeForPay" : bool,
//   "agreeForSelfie": bool

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.freezed.dart';
part 'sign_up_request.g.dart';

@freezed
class SignUpRequest with _$SignUpRequest {
  const factory SignUpRequest({
    required String token,
    required String gender,
    required String pickupTime,
    @Default(false) bool agreeForVedic,
    @Default(false) bool agreeForPay,
    @Default(false) bool agreeForSelfie,
    String? inviteToken,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Object? json) =>
      _$SignUpRequestFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
