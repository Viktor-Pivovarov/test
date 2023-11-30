import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiAnswerMessage extends StatelessWidget {
  const UiAnswerMessage({
    this.onPressed,
    this.content,
    this.child,
    this.title,
    super.key,
  });

  final String? title;
  final String? content;
  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return UiMessage(
      type: UiMessageType.send,
      child: UiEditableMessageSummary(
        title: title,
        content: content,
        onPressedEdit: onPressed,
        child: child,
      ),
    );
  }
}
