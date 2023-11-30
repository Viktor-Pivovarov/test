import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ActiveChatItemMenu extends StatelessWidget {
  const ActiveChatItemMenu({
    required this.child,
    required this.slideKey,
    super.key,
    this.onPressedBlock,
    this.onPressedDelete,
  });

  final Widget child;
  final Key slideKey;

  final Future<bool>? Function()? onPressedBlock;
  final Future<bool>? Function()? onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: context.texts.caption.caption,
          ),
        ),
      ),
      child: Slidable(
        key: slideKey,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.4,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onPressedBlock,
                child: ColoredBox(
                  color: context.colors.button.disabled,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: Insets.xs,
                        ),
                        child: UiIcon(
                          AssetsNew.icons.dsBlock.path,
                          color: context.colors.text.constantWhite,
                        ),
                      ),
                      Text(
                        ChatI18n.block,
                        style: context.texts.caption.caption.copyWith(
                          color: context.colors.text.constantWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onPressedDelete,
                child: ColoredBox(
                  color: context.colors.content.brand,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: Insets.xs,
                        ),
                        child: UiIcon(
                          AssetsNew.icons.dsTrash.path,
                          color: context.colors.text.constantWhite,
                        ),
                      ),
                      Text(
                        ChatI18n.remove,
                        style: context.texts.caption.caption.copyWith(
                          color: context.colors.text.constantWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
