import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    required this.activeIndex,
    required this.setActiveIndex,
    super.key,
  });

  final int activeIndex;

  final void Function(int index, {bool notify}) setActiveIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Insets.bottomNavBar,
      child: Container(
        margin: const EdgeInsets.only(top: Insets.m),
        decoration: BoxDecoration(
          color: context.colors.bg.secondary,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(Insets.xxl),
            topLeft: Radius.circular(Insets.xxl),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(159, 172, 185, 0.3),
              blurRadius: Insets.l,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(Insets.xxl),
            topLeft: Radius.circular(Insets.xxl),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ProfileBottomNavbarIcon(
                isActive: activeIndex == 0,
                onPressed: () => setActiveIndex(0),
              ),
              LikedBottomNavbarIcon(
                isActive: activeIndex == 1,
                onPressed: () => setActiveIndex(1),
              ),
              SelectionBottomNavbarIcon(
                isActive: activeIndex == 2,
                onPressed: () => setActiveIndex(2),
              ),
              ChatBottomNavbarIcon(
                isActive: activeIndex == 3,
                onPressed: () => setActiveIndex(3),
              ),
              MenuBottomNavbarIcon(
                isActive: activeIndex == 4,
                onPressed: () => setActiveIndex(4),
              ),
            ],
          ),

          // BottomNavigationBar(
          //   elevation: 0,
          //   currentIndex: activeIndex,
          //   onTap: setActiveIndex,
          //   type: BottomNavigationBarType.fixed,
          //   showSelectedLabels: false,
          //   showUnselectedLabels: false,
          //   items: [
          //     BottomNavigationBarItem(
          //       label: '',
          //       icon: UiIcon(
          //         Assets.icons.iUser,
          //         color: context.color.smallTextColor,
          //       ),
          //       activeIcon: UiIcon(
          //         Assets.icons.iUser,
          //         color: context.color.mainAccentColor,
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       label: '',
          //       icon: UiIcon(
          //         Assets.icons.iHistory,
          //         color: context.color.smallTextColor,
          //       ),
          //       activeIcon: UiIcon(
          //         Assets.icons.iHistory,
          //         color: context.color.mainAccentColor,
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       label: '',
          //       icon: UiIcon(
          //         Assets.icons.iHeart,
          //         color: context.color.smallTextColor,
          //       ),
          //       activeIcon: UiIcon(
          //         Assets.icons.iHeart,
          //         color: context.color.mainAccentColor,
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       label: '',
          //       icon: UiIcon(
          //         Assets.icons.iChat,
          //         color: context.color.smallTextColor,
          //       ),
          //       activeIcon: UiIcon(
          //         Assets.icons.iChat,
          //         color: context.color.mainAccentColor,
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       label: '',
          //       icon: UiIcon(
          //         Assets.icons.iMenu,
          //         color: context.color.smallTextColor,
          //       ),
          //       activeIcon: UiIcon(
          //         Assets.icons.iMenu,
          //         color: context.color.mainAccentColor,
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
