// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'examination.freezed.dart';
part 'examination.g.dart';

@freezed
class Examination with _$Examination {
  const factory Examination({
    required int id,
    required String image,
  }) = _Examination;

  factory Examination.fromJson(Map<String, dynamic> json) =>
      _$ExaminationFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
