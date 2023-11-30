part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    ChatDTO? chat,
    @Default(false) bool isNotificationEnabled,
  }) = _ChatInitialState;

  factory ChatState.fromJson(Object? json) =>
      _$ChatStateFromJson(json! as Map<String, dynamic>);

  const ChatState._();

  @override
  Map<String, dynamic> toJson();
}
