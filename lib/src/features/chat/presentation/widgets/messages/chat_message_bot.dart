import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChatMessageBot extends StatelessWidget {
  const UiChatMessageBot({required this.item, super.key, this.date});

  final ChatMessageDTO item;

  final DateTime? date;

  String get time => DateHelper.formatToYMDWithTime(item.createdAt);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (date != null) UiChatDateSeparator(date: date),
        Row(
          mainAxisAlignment: alignmentOnType,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: Insets.s),
              child: Container(
                decoration: BoxDecoration(
                  color: item.isMe
                      ? context.colors.bg.tertiary
                      : context.colors.bg.secondary,
                  borderRadius: borderRadiusOnType,
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                padding: const EdgeInsets.all(Insets.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item.message.toString(),
                      style: context.texts.body.base
                          .copyWith(color: context.colors.text.main),
                    ),
                    const SizedBox(height: Insets.s),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          time,
                          style: context.texts.footnote.base.copyWith(
                            color: context.colors.text.secondary,
                          ),
                        ),
                        if (item.status.isDraft)
                          Padding(
                            padding: const EdgeInsets.only(left: Insets.xs),
                            child: Icon(
                              Icons.timer_sharp,
                              size: Insets.l,
                              color: context.colors.content.base,
                            ),
                          ),
                        if (!item.status.isDraft)
                          Padding(
                            padding: const EdgeInsets.only(left: Insets.xs),
                            child: UiIcon(
                              item.status.isSended
                                  ? AssetsNew.icons.dsCheckMono.path
                                  : AssetsNew.icons.dsCheckDouble.path,
                              color: context.colors.content.base,
                              width: Insets.l,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  MainAxisAlignment get alignmentOnType {
    switch (item.sender) {
      case MessageSender.interlocutor:
      case MessageSender.bot:
      case MessageSender.assistant:
        return MainAxisAlignment.start;

      case MessageSender.me:
        return MainAxisAlignment.end;
    }
  }

  BorderRadiusGeometry get borderRadiusOnType {
    switch (item.sender) {
      case MessageSender.me:
        return const BorderRadius.only(
          topLeft: Radius.circular(Insets.l),
          bottomRight: Radius.circular(Insets.l),
          bottomLeft: Radius.circular(Insets.l),
        );
      case MessageSender.interlocutor:
      case MessageSender.assistant:
      case MessageSender.bot:
        return const BorderRadius.only(
          topRight: Radius.circular(Insets.l),
          bottomRight: Radius.circular(
            Insets.l,
          ),
          bottomLeft: Radius.circular(Insets.l),
        );
    }
  }
}
