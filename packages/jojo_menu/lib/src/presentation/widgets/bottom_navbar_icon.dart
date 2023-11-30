import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class MenuBottomNavbarIcon extends StatelessWidget {
  const MenuBottomNavbarIcon({
    required this.onPressed,
    required this.isActive,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      bloc: MenuInjection.sl(),
      builder: (context, state) {
        return BottomNavbarIcon(
          icon: Assets.icons.iMenu,
          onPressed: onPressed,
          isActive: isActive,
        );
      },
    );
  }
}
