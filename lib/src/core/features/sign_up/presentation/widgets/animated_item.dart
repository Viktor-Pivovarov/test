import 'package:flutter/material.dart';

class AnimatedItem extends StatelessWidget {
  const AnimatedItem({
    required this.index,
    required this.animation,
    required this.items,
    super.key,
  });

  final int index;
  final Animation<double> animation;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final Widget item = items.elementAt(index);

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.linear,
          reverseCurve: Curves.linear,
        ),
      ),
      child: item,
    );
  }
}
