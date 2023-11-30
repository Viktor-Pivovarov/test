import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class PendingChatItems extends StatelessWidget {
  const PendingChatItems({
    required this.items,
    required this.itemsCount,
    super.key,
    this.onPressedChat,
    this.onPressedAllChats,
  });

  final List<PendingChatDTO> items;

  final int itemsCount;

  final void Function(String id)? onPressedChat;
  final VoidCallback? onPressedAllChats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Insets.l,
              bottom: items.isEmpty ? Insets.xs : Insets.l,
            ),
            child: Text(
              ChatI18n.newPairs,
              style: context.texts.title.base,
            ),
          ),
          if (items.isEmpty)
            Padding(
              padding: const EdgeInsets.only(left: Insets.l, bottom: Insets.l),
              child: Text(
                ChatI18n.searchingPairs,
                style: context.texts.body.base
                    .copyWith(color: context.colors.text.secondary),
              ),
            ),
          if (items.isNotEmpty)
            SizedBox(
              height: 184,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: Insets.s),
                scrollDirection: Axis.horizontal,
                children: [
                  ...items.map((e) {
                    return PendingChatItem(
                      item: e,
                      onPressedChat: onPressedChat,
                    );
                  }),
                  if (itemsCount > items.length)
                    PendingChatEmptyItem(
                      count: itemsCount,
                      onPressed: onPressedAllChats,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
