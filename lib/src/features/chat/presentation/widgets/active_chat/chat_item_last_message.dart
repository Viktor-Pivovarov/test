import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChatItemLastMessage extends StatelessWidget {
  const UiChatItemLastMessage({
    this.type,
    this.message,
    this.isBlocked = false,
    super.key,
  });

  final String? message;
  final MessageType? type;
  final bool isBlocked;

  @override
  Widget build(BuildContext context) {
    if (isBlocked) {
      return Text(
        ChatI18n.blocked,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.texts.body.base.copyWith(
          color: context.colors.text.secondary,
        ),
      );
    }

    if (type == null) {
      return const SizedBox();
    }

    if (type == MessageType.text) {
      return Text(
        message ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.texts.body.base.copyWith(
          color: context.colors.text.secondary,
        ),
      );
    }

    return Text(
      '[${type!.name}]',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
