import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChatMessageItem extends StatelessWidget {
  const UiChatMessageItem({
    required this.bgColor,
    required this.message,
    required this.textColor,
    required this.status,
    super.key,
    this.borderRadius,
    this.time,
  });

  final Color bgColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget message;
  final Color textColor;
  final MessageStatus status;

  final String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Insets.s),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        padding: const EdgeInsets.all(Insets.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: Insets.s),
              child: DefaultTextStyle(
                style: context.texts.body.base.copyWith(color: textColor),
                child: message,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (time != null)
                  Text(
                    time ?? '',
                    style:
                        context.texts.footnote.base.copyWith(color: textColor),
                  ),
                if (status.isDraft)
                  Padding(
                    padding: const EdgeInsets.only(left: Insets.xs),
                    child: Icon(
                      Icons.timer_sharp,
                      size: Insets.l,
                      color: textColor,
                    ),
                  ),
                if (!status.isDraft)
                  Padding(
                    padding: const EdgeInsets.only(left: Insets.xs),
                    child: UiIcon(
                      status.isSended
                          ? AssetsNew.icons.dsCheckMono.path
                          : AssetsNew.icons.dsCheckDouble.path,
                      color: textColor,
                      width: Insets.l,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
