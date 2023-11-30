// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

const _imageAspectRatio = 496 / 344;
const _imageAspectRatioRev = 344 / 496;
const _countImagesInRow = 3;

class UiPhotoGallery extends StatelessWidget {
  const UiPhotoGallery({
    required this.items,
    this.onReorder,
    this.disabled = false,
    this.align = UiPhotoGalleryAlign.bottomCenter,
    super.key,
  });

  final List<UiPhotoGalleryModel> items;

  final bool disabled;

  final UiPhotoGalleryAlign align;

  final ReorderCallback? onReorder;

  int _calculateRows() {
    int rows = items.length ~/ _countImagesInRow;

    if (items.isNotEmpty && (items.length % _countImagesInRow) != 0) {
      rows++;
    }

    return rows;
  }

  double _calculateHeight(double imageHeight) {
    final rows = _calculateRows();

    final verticalPadding = Insets.l * rows;

    return imageHeight * rows + verticalPadding;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageWidth =
            (constraints.maxWidth - Insets.xxl) / _countImagesInRow;
        final imageHeight = imageWidth * _imageAspectRatio;

        return SizedBox(
          height: _calculateHeight(imageHeight),
          width: items.length >= 3 ? null : imageWidth * items.length,
          child: ReorderableGridView.builder(
            itemCount: items.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: Insets.s,
              crossAxisSpacing: Insets.s,
              crossAxisCount:
                  items.length >= 3 ? _countImagesInRow : items.length,
              childAspectRatio: _imageAspectRatioRev,
            ),
            onReorder: onReorder ?? (oldIndex, newIndex) {},
            shrinkWrap: true,
            dragEnabled: onReorder != null,
            itemBuilder: (context, index) {
              return _UiPhotoGalleryItemWidget(
                key: ValueKey(items[index].id ?? index),
                model: items[index],
                hasError: items[index].hasError,
                height: imageHeight,
                width: imageWidth,
                disabled: disabled,
                align: align,
              );
            },
          ),
        );
      },
    );
  }
}

class _UiPhotoGalleryItemWidget extends StatelessWidget {
  const _UiPhotoGalleryItemWidget({
    required this.model,
    required this.height,
    required this.width,
    required this.disabled,
    required this.align,
    this.hasError = false,
    super.key,
  });

  final UiPhotoGalleryModel model;

  final UiPhotoGalleryAlign align;

  final double width;
  final double height;

  final bool disabled;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: align == UiPhotoGalleryAlign.bottomCenter
              ? const EdgeInsets.only(bottom: Insets.l)
              : const EdgeInsets.only(top: Insets.s, right: Insets.s),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(Insets.xs),
            ),
            child: GestureDetector(
              onTap: model.onPressed,
              child: Container(
                width: width,
                height: double.infinity,
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.8),
                child: model.image != null
                    ? Stack(
                        children: [
                          ColoredBox(
                            color: Colors.black.withOpacity(0.6),
                            child: const UiCircleProgressIndicator(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image: model.image!,
                            width: width,
                            height: height,
                            fit: BoxFit.cover,
                          ),
                          if (model.loading)
                            ColoredBox(
                              color: Colors.black.withOpacity(0.6),
                              child: GestureDetector(
                                onTap: model.onPressedDelete,
                                child: UiCircleProgressIndicator(
                                  width: double.infinity,
                                  height: double.infinity,
                                  percent: model.percent,
                                ),
                              ),
                            ),
                          if (model.hasError)
                            GestureDetector(
                              onTap: model.onPressedRepeat,
                              child: ColoredBox(
                                color: Colors.black.withOpacity(0.6),
                                child: SizedBox.expand(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                bottom: Insets.s,
                                              ),
                                              child: AttentionIcon(),
                                            ),
                                            Text(
                                              'Ошибка\nзагрузки', // TODO (afurmanchuk): Переделать на переводы
                                              textAlign: TextAlign.center,
                                              style: context.text.smallText
                                                  .copyWith(
                                                color:
                                                    context.color.fillBgColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: Insets.m,
                                        ),
                                        child: Text(
                                          'Повторить', // TODO (afurmanchuk): Переделать на переводы
                                          style:
                                              context.text.smallText.copyWith(
                                            color: context.color.fillBgColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    : model.child ??
                        ColoredBox(
                          color: Colors.black.withOpacity(0.6),
                          child: const UiCircleProgressIndicator(
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
              ),
            ),
          ),
        ),
        Visibility(
          visible:
              (!disabled && model.onPressedDelete != null) || model.hasError,
          child: Positioned.fill(
            right: align == UiPhotoGalleryAlign.bottomCenter ? 0.0 : Insets.m,
            top: align == UiPhotoGalleryAlign.bottomCenter ? 0.0 : Insets.m,
            child: Align(
              alignment: align == UiPhotoGalleryAlign.bottomCenter
                  ? Alignment.bottomCenter
                  : Alignment.topRight,
              child: InkWell(
                onTap: () {
                  model.onPressedDelete?.call();
                },
                child: UIShadow(
                  boxShadow: [
                    BoxShadow(
                      color: context.color.shadow,
                      blurRadius: Insets.l,
                    ),
                  ],
                  child: Container(
                    padding: const EdgeInsets.all(Insets.s),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: UiIcon(
                      Assets.icons.x,
                      width: Insets.s,
                      height: Insets.s,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UiPhotoGalleryModel {
  UiPhotoGalleryModel({
    required this.image,
    required this.loading,
    this.id,
    this.child,
    this.onPressed,
    this.percent,
    this.onPressedDelete,
    this.hasError = false,
    this.onPressedRepeat,
  });

  final ImageProvider<Object>? image;
  final int? id;
  final Widget? child;
  final bool loading;
  final VoidCallback? onPressed;
  final VoidCallback? onPressedDelete;
  final double? percent;
  final bool hasError;
  final VoidCallback? onPressedRepeat;

  UiPhotoGalleryModel copyWith({
    ImageProvider<Object>? image,
    Widget? child,
    bool? loading,
    VoidCallback? onPressed,
    VoidCallback? onPressedDelete,
  }) {
    return UiPhotoGalleryModel(
      image: image ?? this.image,
      child: child ?? this.child,
      loading: loading ?? this.loading,
      onPressed: onPressed ?? this.onPressed,
      onPressedDelete: onPressedDelete ?? this.onPressedDelete,
    );
  }
}

enum UiPhotoGalleryAlign { topRight, bottomCenter }
