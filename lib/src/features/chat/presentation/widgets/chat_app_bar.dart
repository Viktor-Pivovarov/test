import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChatAppBar extends StatelessWidget {
  const UiChatAppBar({
    super.key,
    this.chat,
    this.onPressedProfile,
    this.onPressedToggleMute,
    this.onPressedBlock,
    this.isNotificationEnabled = false,
  });

  final ChatDTO? chat;

  final bool isNotificationEnabled;

  final VoidCallback? onPressedProfile;
  final VoidCallback? onPressedToggleMute;
  final VoidCallback? onPressedBlock;

  @override
  Widget build(BuildContext context) {
    if (chat == null) {
      return const SizedBox();
    }

    String? lastVisitString = ChatI18n.lastVisit(
      chat!.interlocutor.gender.name,
      chat!.lastVisitString ?? '',
    );

    if (chat?.lastVisitString == 'recently') {
      lastVisitString =
          ChatI18n.lastVisitRecently(chat!.interlocutor.gender.name);
    } else if (chat?.lastVisitString == 'yesterday') {
      lastVisitString =
          ChatI18n.lastVisitYesterday(chat!.interlocutor.gender.name);
    }

    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: onPressedProfile,
          child: UiProfileAppBarCard(
            isOnline: chat!.isOnline,
            photo: chat?.interlocutor.photo,
            showStatus: chat!.lastVisit != null || chat!.isOnline,
            status: (!chat!.isOnline) ? lastVisitString : null,
            name: Text(
              chat!.interlocutor.firstName,
              style: context.texts.title.base,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: Insets.s),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UiIcon.button(
                  (!isNotificationEnabled || chat!.isMuted)
                      ? AssetsNew.icons.dsBellOff.path
                      : AssetsNew.icons.dsBell.path,
                  width: 24,
                  padding: const EdgeInsets.all(Insets.s),
                  onPressed: onPressedToggleMute,
                ),
                UiIcon.button(
                  AssetsNew.icons.dsBlock.path,
                  width: 24,
                  padding: const EdgeInsets.all(Insets.s),
                  onPressed: onPressedBlock,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
