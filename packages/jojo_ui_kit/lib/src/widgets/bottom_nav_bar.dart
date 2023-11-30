import 'package:flutter/material.dart';

typedef BottomNavBarItem = Widget Function({
  required VoidCallback onPressed,
  bool isActive,
});

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.searchIcon,
    required this.searchCount,
    required this.items,
    super.key,
    this.profileHasError = false,
  });

  final bool profileHasError;
  final int currentIndex;
  final void Function(int index) onTap;
  final String searchIcon;
  final int searchCount;

  final List<BottomNavBarItem> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 76,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color.fromRGBO(159, 172, 185, 0.3),
                  offset: Offset(0, -16),
                  blurRadius: 40,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 85,
            child: Row(
              children: items
                  .asMap()
                  .entries
                  .map((MapEntry<int, BottomNavBarItem> item) {
                return Expanded(
                  child: item.value(
                    onPressed: () => onTap(item.key),
                    isActive: item.key == currentIndex,
                  ),
                );
              }).toList(),

              // <Widget>[
              //   Expanded(
              //     child: Stack(
              //       children: <Widget>[
              //         UiCircleButton(
              //           padding: const EdgeInsets.all(Insets.l),
              //           onPressed: () => onTap(0),
              //           child: CrossPlatformSvg.asset(
              //             Assets.icons.user,
              //             color: currentIndex == 0
              //                 ? Theme.of(context).primaryColor
              //                 : Theme.of(context).iconTheme.color,
              //           ),
              //         ),
              //         if (profileHasError)
              //           const Positioned(
              //             right: 16,
              //             top: 4,
              //             child: AttentionIcon(
              //               useBorder: false,
              //               size: 18.0,
              //             ),
              //           ),
              //       ],
              //     ),
              //   ),
              //   Expanded(
              //     child: Stack(
              //       alignment: Alignment.center,
              //       children: <Widget>[
              //         UiCircleButton(
              //           padding: const EdgeInsets.all(Insets.l),
              //           onPressed: () => onTap(1),
              //           child: CrossPlatformSvg.asset(
              //             Assets.icons.history,
              //             color: currentIndex == 1
              //                 ? Theme.of(context).primaryColor
              //                 : Theme.of(context).iconTheme.color,
              //           ),
              //         ),
              //         _Badge(badge: searchCount),
              //       ],
              //     ),
              //   ),
              //   Expanded(
              //     child: Stack(
              //       alignment: Alignment.center,
              //       children: <Widget>[
              //         UiCircleButton(
              //           padding: const EdgeInsets.all(Insets.l),
              //           onPressed: () => onTap(2),
              //           child: CrossPlatformSvg.asset(
              //             searchIcon,
              //             color: currentIndex == 2
              //                 ? Theme.of(context).primaryColor
              //                 : Theme.of(context).iconTheme.color,
              //           ),
              //         ),
              //         _Badge(badge: searchCount),
              //       ],
              //     ),
              //   ),
              //   // Expanded(
              //   //   child: UiCircleButton(
              //   //     padding: const EdgeInsets.all(Insets.l),
              //   //     onPressed: () => onTap(1),
              //   //     child: CrossPlatformSvg.asset(
              //   //       Assets.icons.bookOpen,
              //   //       color: currentIndex == 1
              //   //           ? Theme.of(context).primaryColor
              //   //           : Theme.of(context).iconTheme.color,
              //   //     ),
              //   //   ),
              //   // ),

              //   // Container(
              //   //   width: 58.0,
              //   //   height: 58.0,
              //   //   margin: const EdgeInsets.only(bottom: Insets.l * 1.5),
              //   //   decoration: BoxDecoration(
              //   //     color: Colors.white,
              //   //     borderRadius: BorderRadius.circular(100.0),
              //   //     boxShadow: const <BoxShadow>[
              //   //       BoxShadow(
              //   //         color: Color.fromRGBO(138, 185, 240, 0.25),
              //   //         offset: Offset(4, 4),
              //   //         blurRadius: 13,
              //   //       ),
              //   //       BoxShadow(
              //   //         color: Color.fromRGBO(255, 255, 255, 0.25),
              //   //         offset: Offset(-4, -4),
              //   //         blurRadius: 4,
              //   //       ),
              //   //     ],
              //   //   ),
              //   //   child: Stack(
              //   //     children: <Widget>[
              //   //       UiCircleButton(
              //   //         onPressed: () => onTap(2),
              //   //         padding: const EdgeInsets.all(Insets.l),
              //   //         child: CrossPlatformSvg.asset(
              //   //           searchIcon,
              //   //           color: currentIndex == 2
              //   //               ? Theme.of(context).primaryColor
              //   //               : Theme.of(context).iconTheme.color,
              //   //         ),
              //   //       ),
              //   //       _Badge(badge: searchCount),
              //   //     ],
              //   //   ),
              //   // ),
              //   Expanded(
              //     child: UiCircleButton(
              //       padding: const EdgeInsets.all(Insets.l),
              //       onPressed: () => onTap(3),
              //       child: CrossPlatformSvg.asset(
              //         Assets.icons.history,
              //         color: currentIndex == 3
              //             ? Theme.of(context).primaryColor
              //             : Theme.of(context).iconTheme.color,
              //       ),
              //     ),
              //   ),
              //   Expanded(
              //     child: UiCircleButton(
              //       padding: const EdgeInsets.all(Insets.l),
              //       onPressed: () => onTap(4),
              //       child: CrossPlatformSvg.asset(
              //         Assets.icons.menu,
              //         color: currentIndex == 4
              //             ? Theme.of(context).primaryColor
              //             : Theme.of(context).iconTheme.color,
              //       ),
              //     ),
              //   ),
              // ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.badge,
  });

  final int badge;

  @override
  Widget build(BuildContext context) {
    if (badge == 0) {
      return Positioned(
        right: 3,
        top: 3,
        child: Container(),
      );
    }

    return Positioned(
      right: 16,
      top: 3,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(90),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Center(
          child: Text(
            badge.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
