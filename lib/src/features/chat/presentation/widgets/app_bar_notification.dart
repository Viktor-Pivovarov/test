import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

enum AppBarNotificationType {
  error,
  success;

  bool get isError => this == error;
}

class UiAppBarNotification extends StatelessWidget
    implements PreferredSizeWidget {
  const UiAppBarNotification({
    super.key,
    this.onPressed,
    this.type = AppBarNotificationType.error,
  });

  final VoidCallback? onPressed;
  final AppBarNotificationType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Insets.l),
      decoration: BoxDecoration(
        color: type.isError
            ? context.colors.bg.brand
            : context.colors.content.success,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Insets.l),
          bottomRight: Radius.circular(Insets.l),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: Insets.s),
            child: UiIcon(
              AssetsNew.icons.dsNavigationCross.path,
              color: context.colors.content.inverse,
            ),
          ),
          Expanded(
            child: Text(
              'PUSH-уведомления отключены и ты можешь пропустить сообщения',
              style: context.texts.body.base.copyWith(
                color: context.colors.content.inverse,
              ),
            ),
          ),
          UiMiniButton(
            text: 'Включить',
            type: UiMiniButtonType.inverse,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
