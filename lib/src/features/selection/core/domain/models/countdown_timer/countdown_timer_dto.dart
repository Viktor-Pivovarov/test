import 'package:freezed_annotation/freezed_annotation.dart';

part 'countdown_timer_dto.freezed.dart';
part 'countdown_timer_dto.g.dart';

@freezed
class CountdownTimerDTO with _$CountdownTimerDTO {
  const factory CountdownTimerDTO({
    @Default(0) int hours,
    @Default(0) int minutes,
    @Default(0) int seconds,
  }) = _CountdownTimerDTO;

  factory CountdownTimerDTO.fromJson(Object? json) =>
      _$CountdownTimerDTOFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
