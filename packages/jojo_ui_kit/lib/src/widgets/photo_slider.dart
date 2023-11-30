import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiPhotoSlider extends StatefulWidget {
  const UiPhotoSlider({
    required this.photos,
    super.key,
    this.padding,
    this.emptyPhotosText,
    this.borderRadius,
    this.bottomContent,
    this.onPressedPhoto,
  });

  final List<String> photos;
  final EdgeInsetsGeometry? padding;
  final String? emptyPhotosText;
  final BorderRadius? borderRadius;

  final void Function(int index)? onPressedPhoto;

  final Widget? bottomContent;

  @override
  State<UiPhotoSlider> createState() => _UiPhotoSliderState();
}

class _UiPhotoSliderState extends State<UiPhotoSlider> {
  final CacheManager _cacheManager = CustomCacheManager.instance;
  final PageController _pageController = PageController();

  List<StreamSubscription<String?>> subscriptions =
      <StreamSubscription<String?>>[];

  double currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(_listener);

    for (final String element in widget.photos) {
      _cacheManager.downloadFile(element);
    }
  }

  void _listener() {
    setState(() {
      currentPage = _pageController.page ?? 0;
    });
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_listener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: widget.padding ?? const EdgeInsets.only(bottom: Insets.l),
          child: ClipRRect(
            borderRadius: widget.borderRadius ??
                BorderRadius.circular(BorderRadiusInsets.l),
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth * 496 / 344,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  if (widget.photos.isNotEmpty)
                    PageView(
                      controller: _pageController,
                      children: widget.photos
                          .map<Widget>(
                            (String e) => GestureDetector(
                              onTap: widget.onPressedPhoto != null
                                  ? () {
                                      widget.onPressedPhoto
                                          ?.call(widget.photos.indexOf(e));
                                    }
                                  : null,
                              child: CacheImage(
                                url: e,
                                cacheManager: _cacheManager,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  if (widget.photos.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(Insets.l),
                        child: Text(
                          widget.emptyPhotosText ??
                              'Photos have not been uploaded',
                        ),
                      ),
                    ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: Insets.l * 1.5),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.black,
                            Colors.black.withOpacity(0),
                          ],
                          stops: const <double>[0, 1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Column(
                        children: [
                          _PageDots(
                            count: widget.photos.length,
                            currentPage: currentPage,
                          ),
                          widget.bottomContent ?? const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PageDots extends StatelessWidget {
  const _PageDots({
    required this.count,
    required this.currentPage,
  });

  final double currentPage;
  final int count;

  double get size => Insets.s;

  @override
  Widget build(BuildContext context) {
    return count < 2
        ? Container()
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              count,
              (int index) {
                return Container(
                  width: size,
                  height: size,
                  margin: const EdgeInsets.symmetric(horizontal: Insets.s / 2),
                  decoration: BoxDecoration(
                    color: context.colors.content.inverse.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Insets.xxl * 4),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: (currentPage * size) - (index * size),
                          child: Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                              color: context.colors.content.brand,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
