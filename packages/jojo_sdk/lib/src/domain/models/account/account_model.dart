import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    required String email,
  }) = _AccountModel;

  factory AccountModel.fromJson(Object? json) =>
      _$AccountModelFromJson(json! as Map<String, dynamic>);

  const AccountModel._();

  @override
  Map<String, dynamic> toJson();
}
