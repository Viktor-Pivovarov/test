import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChatItemAvatar extends StatelessWidget {
  const UiChatItemAvatar({
    this.isBlocked = false,
    this.isOnline = false,
    super.key,
    this.avatar,
  });

  final bool isBlocked;
  final bool isOnline;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!isBlocked)
          CacheImage(
            url: avatar,
            width: 64,
            height: 64,
            radius: 100,
          ),
        if (isBlocked)
          SizedBox(
            width: 64,
            height: 64,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.content.tertiary,
              ),
              child: Center(
                child: UiIcon(
                  AssetsNew.icons.dsUserBlockBold.path,
                  color: context.colors.content.secondary,
                ),
              ),
            ),
          ),
        if (isOnline && !isBlocked)
          Positioned(
            right: Insets.xs,
            bottom: Insets.xs,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                color: context.colors.content.success,
                border: Border.all(
                  width: 2,
                  color: context.colors.content.inverse,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
