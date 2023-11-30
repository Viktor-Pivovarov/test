import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ActiveChatItem extends StatelessWidget {
  const ActiveChatItem({
    required this.item,
    super.key,
    this.onPressedBlock,
    this.onPressedChat,
    this.onPressedDelete,
    this.isNotificationEnabled = false,
  });

  final ChatDTO item;

  final bool isNotificationEnabled;

  final void Function(String id)? onPressedChat;

  final Future<bool> Function(String id)? onPressedBlock;
  final Future<bool> Function(String id)? onPressedDelete;

  bool get isMuted {
    return !isNotificationEnabled || item.isMuted;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedChat != null && !item.isBlocked
          ? () => onPressedChat?.call(item.id)
          : null,
      child: Theme(
        data: context.theme.copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              textStyle: context.texts.caption.caption,
            ),
          ),
        ),
        child: ActiveChatItemMenu(
          slideKey: ValueKey(item.id),
          onPressedBlock: () => onPressedBlock?.call(item.id),
          onPressedDelete: () => onPressedDelete?.call(item.id),
          child: UiChatItem(
            date: item.lastMessage?.createdAt,
            message: item.lastMessage?.message.toString(),
            messageSender: item.lastMessage?.sender,
            messageStatus: item.lastMessage?.status,
            messageType: item.lastMessage?.type,
            name: item.interlocutor.firstName,
            avatar: item.interlocutor.photo,
            isBlocked: item.isBlocked,
            isMuted: isMuted,
            isOnline: item.isOnline,
            unreadCount: item.unreadCount,
          ),
        ),
      ),
    );
  }
}
