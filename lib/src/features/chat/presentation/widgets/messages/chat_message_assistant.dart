import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChatMessageAssistant extends StatelessWidget {
  const UiChatMessageAssistant({required this.item, super.key});

  final ChatMessageDTO item;

  String get time => DateHelper.formatToYMDWithTime(item.createdAt);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: Insets.xs),
          child: UiImage(AssetsNew.images.other.jojoAvatar.path, width: 40),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: Insets.s),
                child: Text(
                  'JOJO',
                  style: context.texts.footnote.baseSemibold
                      .copyWith(color: context.colors.text.secondary),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: Insets.s),
                child: Container(
                  padding: const EdgeInsets.all(Insets.l),
                  decoration: BoxDecoration(
                    color: context.colors.content.success,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(Insets.l),
                      bottomRight: Radius.circular(
                        Insets.l,
                      ),
                      bottomLeft: Radius.circular(Insets.l),
                    ),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: Insets.s),
                        child: Text(
                          item.message.toString(),
                          style: context.texts.body.base.copyWith(
                            color: context.colors.text.constantWhite,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            time,
                            style: context.texts.footnote.base.copyWith(
                              color: context.colors.text.constantWhite,
                            ),
                          ),
                          if (item.status.isDraft)
                            Padding(
                              padding: const EdgeInsets.only(left: Insets.xs),
                              child: Icon(
                                Icons.timer_sharp,
                                size: Insets.l,
                                color: context.colors.text.constantWhite,
                              ),
                            ),
                          if (!item.status.isDraft)
                            Padding(
                              padding: const EdgeInsets.only(left: Insets.xs),
                              child: UiIcon(
                                item.status.isSended
                                    ? AssetsNew.icons.dsCheckMono.path
                                    : AssetsNew.icons.dsCheckDouble.path,
                                color: context.colors.text.constantWhite,
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
        ),
      ],
    );
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
