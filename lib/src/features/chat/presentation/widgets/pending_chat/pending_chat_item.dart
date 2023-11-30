import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class PendingChatItem extends StatelessWidget {
  const PendingChatItem({
    required this.item,
    super.key,
    this.onPressedChat,
  });

  final PendingChatDTO item;

  final void Function(String id)? onPressedChat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressedChat?.call(item.id),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Insets.xs,
          Insets.zero,
          Insets.xs,
          Insets.zero,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: Insets.s),
              child: SizedBox(
                width: 117,
                height: 160,
                child: Stack(
                  children: [
                    CacheImage(
                      url: item.interlocutor.photo,
                      radius: Insets.xs,
                    ),
                    Positioned(
                      right: Insets.s,
                      bottom: Insets.s,
                      child: UiIcon(
                        Assets.icons.iParkSolidProtect,
                        useColor: false,
                      ),
                    ),
                    if (item.isNew)
                      Positioned(
                        left: Insets.s,
                        bottom: Insets.s,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Insets.xs,
                            vertical: Insets.xxs,
                          ),
                          decoration: BoxDecoration(
                            color: context.color.green,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Insets.xxl),
                            ),
                          ),
                          child: Text(
                            'NEW',
                            style: context.text.chatText.copyWith(
                              color: context.color.fillBgColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 117,
              child: Text(
                item.interlocutor.firstName,
                style: context.texts.footnote.baseSemibold.copyWith(
                  color: context.colors.text.main,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
