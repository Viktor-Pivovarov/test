import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ChatBottomNavbarIcon extends StatelessWidget {
  const ChatBottomNavbarIcon({
    required this.onPressed,
    required this.isActive,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      bloc: ChatInjection.sl(),
      builder: (context, state) {
        return BottomNavbarIcon(
          icon: Assets.icons.iChat,
          onPressed: onPressed,
          isActive: isActive,
        );
      },
    );
  }
}
