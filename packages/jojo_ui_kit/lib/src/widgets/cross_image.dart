import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class CrossImage extends StatelessWidget {
  const CrossImage(
    this.url, {
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.topCenter,
    super.key,
  });

  final String url;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    if (url.contains('svg')) {
      return CrossPlatformSvg.asset(
        url,
        width: width,
        height: height,
        color: color,
        fit: fit,
        alignment: alignment,
      );
    }

    return Image.asset(
      url,
      package: 'jojo_ui_kit',
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
    );
  }
}
