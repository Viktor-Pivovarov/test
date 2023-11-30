import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidate_model.freezed.dart';
part 'candidate_model.g.dart';

@freezed
class CandidateModel with _$CandidateModel {
  const factory CandidateModel({
    required String userId,
    required String firstName,
    required String age,
    required String photo,
  }) = _CandidateModel;

  factory CandidateModel.fromJson(Object? json) =>
      _$CandidateModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
