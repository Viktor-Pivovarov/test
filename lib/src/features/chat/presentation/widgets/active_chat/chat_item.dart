import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChatItem extends StatelessWidget {
  const UiChatItem({
    required this.name,
    this.messageStatus,
    this.messageSender,
    this.messageType,
    this.message,
    this.date,
    this.unreadCount = 0,
    this.isBlocked = false,
    this.isMuted = false,
    this.isOnline = false,
    super.key,
    this.avatar,
  });

  final String name;
  final String? message;
  final DateTime? date;
  final int unreadCount;
  final bool isBlocked;
  final bool isMuted;
  final bool isOnline;
  final MessageStatus? messageStatus;
  final MessageSender? messageSender;
  final MessageType? messageType;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(left: Insets.l),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                Insets.zero,
                Insets.s,
                Insets.l,
                Insets.s,
              ),
              child: UiChatItemAvatar(
                avatar: avatar,
                isBlocked: isBlocked,
                isOnline: isOnline,
              ),
            ),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: context.colors.content.divider.withOpacity(0.5),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: Insets.l),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiChatItemFirstRow(
                        date: date,
                        messageSender: messageSender,
                        messageStatus: messageStatus,
                        name: name,
                        isBlocked: isBlocked,
                        isMuted: isMuted,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: UiChatItemLastMessage(
                              type: messageType,
                              isBlocked: isBlocked,
                              message: message,
                            ),
                          ),
                          if (unreadCount > 0 && !isBlocked)
                            UiBadge(
                              text: '$unreadCount',
                              color: isMuted
                                  ? context.colors.content.secondary
                                  : null,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
