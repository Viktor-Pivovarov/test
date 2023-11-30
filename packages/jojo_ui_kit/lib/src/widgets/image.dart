import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UiImage extends StatelessWidget {
  const UiImage(
    this.asset, {
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    super.key,
  });

  final String asset;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (asset.contains('svg')) {
      return SvgPicture.asset(
        asset,
        package: 'jojo_ui_kit',
        width: width,
        height: height,
        fit: fit,
      );
    }

    return Image.asset(
      asset,
      package: 'jojo_ui_kit',
      width: width,
      height: height,
      fit: fit,
    );
  }
}
