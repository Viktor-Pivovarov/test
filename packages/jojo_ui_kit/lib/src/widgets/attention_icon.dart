import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class AttentionIcon extends StatelessWidget {
  const AttentionIcon({
    super.key,
    this.useBorder = true,
    this.size = 22.0,
    this.padding,
  });

  final bool useBorder;

  final double size;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            border:
                useBorder ? Border.all(color: Colors.white, width: 2) : null,
            borderRadius: BorderRadius.circular(15),
            color: context.color.mainAccentColor,
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              child: Text(
                '!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
