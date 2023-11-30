import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CrossPlatformSvg {
  static Widget asset(
    String assetPath, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
    Alignment alignment = Alignment.center,
    String? semanticsLabel,
  }) {
    return Builder(
      builder: (BuildContext context) {
        if (kIsWeb) {
          return Image.asset(
            assetPath,
            width: width,
            height: height,
            fit: fit,
            color: color,
            package: 'jojo_ui_kit',
            alignment: alignment,
          );
        }

        return SvgPicture.asset(
          assetPath,
          package: 'jojo_ui_kit',
          width: width,
          height: height,
          fit: fit,
          color: color,
          alignment: alignment,
          placeholderBuilder: (_) => const CircularProgressIndicator.adaptive(),
        );
      },
    );

    // `kIsWeb` is a special Flutter variable that just exists
    // Returns true if we're on web, false for mobile
  }
}
