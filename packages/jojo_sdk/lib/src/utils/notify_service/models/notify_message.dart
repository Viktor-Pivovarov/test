// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notify_message.freezed.dart';
part 'notify_message.g.dart';

enum NotifyMessageType { success, error, warning, defaults }

@freezed
class NotifyMessageModel with _$NotifyMessageModel {
  const factory NotifyMessageModel({
    required NotifyMessageType type,
    required String message,
    required Duration duration,
  }) = _NotifyMessageModel;

  factory NotifyMessageModel.fromJson(Object? json) =>
      _$NotifyMessageModelFromJson(json! as Map<String, dynamic>);

  const NotifyMessageModel._();

  @override
  Map<String, dynamic> toJson();
}
