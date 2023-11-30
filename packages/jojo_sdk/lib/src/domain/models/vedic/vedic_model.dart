import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'vedic_model.freezed.dart';
part 'vedic_model.g.dart';

@freezed
class VedicModel with _$VedicModel {
  const factory VedicModel({
    String? birthtime,
    String? timezoneBorn,
    LocationModel? birthLocation,
  }) = _VedicModel;

  factory VedicModel.fromJson(Object? json) =>
      _$VedicModelFromJson(json! as Map<String, dynamic>);

  const VedicModel._();

  @override
  Map<String, dynamic> toJson();

  String? get birthtimeFormat {
    if (birthtime == null) {
      return null;
    }

    final birthtimeValue = birthtime!.split(':');

    return '${birthtimeValue[0]}:${birthtimeValue[1]}';
  }
}
