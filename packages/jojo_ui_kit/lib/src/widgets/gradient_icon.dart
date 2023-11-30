import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon(this.assetName, this.size, this.gradient, {super.key});

  final String assetName;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: SvgPicture.asset(
          assetName,
          package: 'jojo_ui_kit',
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
