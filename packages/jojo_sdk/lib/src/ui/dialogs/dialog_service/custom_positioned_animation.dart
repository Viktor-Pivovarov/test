import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';

final class CustomPositionedAnimation
    extends EasyDialogDecoration<PositionedDialog> {
  @override
  Widget call(EasyDialog dialog) {
    final animation = dialog.context.animation;

    final offset = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.fastOutSlowIn)).animate(animation);
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) => Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: Colors.black.withOpacity(
                animation.value.clamp(0.0, 0.6),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(position: offset, child: dialog.content),
          ),
        ],
      ),
    );
  }
}
