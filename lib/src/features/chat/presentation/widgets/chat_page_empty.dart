import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ChatPageEmpty extends StatelessWidget {
  const ChatPageEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Insets.xxl,
        Insets.xxl,
        Insets.xxl,
        Insets.l,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.xxl),
            child: UiImage(Assets.images.emptyChat),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.s),
            child: Text(
              ChatI18n.emptyChatsTitle,
              style: context.texts.headline.second
                  .copyWith(color: context.colors.text.main),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            ChatI18n.emptyChats,
            style: context.texts.body.base
                .copyWith(color: context.colors.text.main),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
