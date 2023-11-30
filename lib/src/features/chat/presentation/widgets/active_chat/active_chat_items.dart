import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';

class ActiveChatItems extends StatelessWidget {
  const ActiveChatItems({
    required this.items,
    super.key,
    this.onPressedBlock,
    this.onPressedChat,
    this.onPressedDelete,
    this.isNotificationEnabled = false,
  });

  final List<ChatDTO> items;

  final void Function(String id)? onPressedChat;

  final bool isNotificationEnabled;

  final Future<bool> Function(String id)? onPressedBlock;
  final Future<bool> Function(String id)? onPressedDelete;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const ActiveChatEmpty();
    }

    return Column(
      children: items
          .map(
            (e) => ActiveChatItem(
              item: e,
              isNotificationEnabled: isNotificationEnabled,
              onPressedBlock: onPressedBlock,
              onPressedChat: onPressedChat,
              onPressedDelete: onPressedDelete,
            ),
          )
          .toList(),
    );
  }
}
