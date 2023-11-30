part of 'chats_cubit.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState.initial({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    @Default([]) List<ChatDTO> chats,
    @Default([]) List<PendingChatDTO> pendingChats,
    @Default(0) int pendingChatsCount,
    @Default(false) bool isNotificationEnabled,
  }) = _ChatInitialState;

  factory ChatsState.fromJson(Object? json) =>
      _$ChatsStateFromJson(json! as Map<String, dynamic>);

  const ChatsState._();

  @override
  Map<String, dynamic> toJson();
}
