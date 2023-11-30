import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChatItemFirstRow extends StatelessWidget {
  const UiChatItemFirstRow({
    this.name,
    this.date,
    this.messageSender,
    this.messageStatus,
    this.isBlocked = false,
    this.isMuted = false,
    super.key,
  });

  final String? name;
  final DateTime? date;
  final bool isBlocked;
  final bool isMuted;

  final MessageStatus? messageStatus;
  final MessageSender? messageSender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              if (name != null)
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: Insets.xs),
                    child: Text(
                      name ?? '',
                      style: context.texts.body.bigSemibold.copyWith(
                        color: (messageSender?.isAssistant ?? false)
                            ? context.colors.text.link
                            : context.colors.text.main,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              if (isMuted && !isBlocked)
                Padding(
                  padding: const EdgeInsets.only(right: Insets.xs),
                  child: UiIcon(Assets.icons.bellMuted),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: Insets.xs),
          child: Builder(
            builder: (_) {
              if (isBlocked || messageStatus == null) {
                return const SizedBox();
              }

              if (messageStatus!.isDelivered) {
                return UiIcon(AssetsNew.icons.dsCheckDouble.path);
              }

              if (messageStatus!.isSended) {
                return UiIcon(AssetsNew.icons.dsCheckMono.path);
              }

              return const SizedBox();
            },
          ),
        ),
        if (!isBlocked || date != null)
          Text(
            date != null ? DateHelper.formatToLocalTime(date!) : '',
            style: context.texts.footnote.base.copyWith(
              color: context.colors.text.secondary,
            ),
          ),
      ],
    );
  }
}
