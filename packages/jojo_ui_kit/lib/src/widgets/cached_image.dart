import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    super.key,
    this.url,
    this.defaultAsset,
    this.radius,
    this.fit,
    this.alignment,
    this.cacheManager,
    this.width,
    this.height,
    this.backgroundColor,
  });

  final String? url;
  final String? defaultAsset;
  final double? radius;
  final double? width;
  final double? height;
  final CacheManager? cacheManager;
  final BoxFit? fit;
  final Alignment? alignment;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (url != null && url!.contains('http')) {
      return CachedNetworkImage(
        cacheManager: cacheManager,
        width: width,
        height: height,
        imageUrl: url!,
        progressIndicatorBuilder:
            (BuildContext context, String url, DownloadProgress progress) {
          if (progress.totalSize == null) {
            return Container();
          }

          return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius ?? 0.0),
            ),
            child: const Align(
              child: UiLoader(),
            ),
          );
        },
        errorWidget: (BuildContext context, String url, dynamic error) =>
            Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius ?? 0.0),
          ),
          child: const Icon(
            Icons.error_outline_outlined,
            // color: ThemeConfig.grey,
          ),
        ),
        alignment: alignment ?? Alignment.center,
        imageBuilder:
            (BuildContext context, ImageProvider<Object> imageProvider) {
          return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius ?? 0.0),
              image: DecorationImage(
                image: imageProvider,
                fit: fit ?? BoxFit.cover,
              ),
            ),
          );
        },
      );
    }

    if (defaultAsset != null) {
      return CrossImage(
        defaultAsset!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        alignment: alignment ?? Alignment.topCenter,
      );
    }

    if (url != null) {
      return CrossImage(
        url!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        alignment: alignment ?? Alignment.topCenter,
      );
    }

    return Container();
  }
}
