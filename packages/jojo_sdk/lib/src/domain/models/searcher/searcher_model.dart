import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'searcher_model.freezed.dart';
part 'searcher_model.g.dart';

enum SearchStatus { active, pending, reject }

enum SearcherGender { male, female }

@freezed
class SearcherModel with _$SearcherModel {
  const factory SearcherModel({
    required SearcherGender gender,
    required String pickupTime,
    required SearchStatus searchStatus,
    required LocationModel location,
    int? age,
    int? height,
    @Default(false) bool agreeForVedic,
  }) = _SearcherModel;

  factory SearcherModel.fromJson(Object? json) =>
      _$SearcherModelFromJson(json! as Map<String, dynamic>);

  const SearcherModel._();

  @override
  Map<String, dynamic> toJson();
}
