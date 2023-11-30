import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class PendingChatEmptyItem extends StatelessWidget {
  const PendingChatEmptyItem({
    required this.count,
    super.key,
    this.onPressed,
  });

  final int count;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
                height: 174,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: context.colors.bg.secondary,
                          borderRadius: BorderRadius.circular(Insets.xs),
                        ),
                        child: Center(
                          child: Text(
                            ChatI18n.watchAllPairs,
                            style: context.texts.body.baseSemibold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Insets.xs,
                          horizontal: Insets.s,
                        ),
                        decoration: BoxDecoration(
                          color: context.colors.content.brand,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: context.colors.content.inverse,
                          ),
                        ),
                        child: Text(
                          count.clamp(0, 10000).toString(),
                          style: context.texts.body.baseSemibold.copyWith(
                            color: context.colors.text.constantWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
