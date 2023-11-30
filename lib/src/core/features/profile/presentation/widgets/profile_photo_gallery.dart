import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ProfilePhotoGallery extends StatelessWidget {
  const ProfilePhotoGallery({
    super.key,
    this.photos = const [],
    this.tempPhotos = const [],
    this.emptyPhotos = const [],
  });

  final List<UiPhotoGalleryModel> photos;
  final List<PhotoEntity> tempPhotos;
  final List<int> emptyPhotos;

  @override
  Widget build(BuildContext context) {
    return UiPhotoGallery(
      align: UiPhotoGalleryAlign.topRight,
      onReorder: context.read<ProfilePhotosCubit>().onReorderPhotos,
      items: [
        ...photos.asMap().entries.map(
              (entry) => entry.value.copyWith(
                onPressedDelete: entry.value.loading
                    ? null
                    : () => context
                        .read<ProfilePhotosCubit>()
                        .onPressedDeletePhoto(entry.key),
              ),
            ),
        ...tempPhotos.map(
          (e) => UiPhotoGalleryModel(
            image: MemoryImage(Uint8List.fromList(e.image)),
            loading: e.isLoading,
            hasError: e.hasError,
            percent: e.percent,
            onPressedDelete: () =>
                context.read<ProfilePhotosCubit>().onPressedDeleteTempPhoto(
                      tempPhotos.indexOf(e),
                    ),
            onPressedRepeat: e.hasError
                ? () => context
                    .read<ProfilePhotosCubit>()
                    .onPressedRepeatUploadPhoto(e)
                : null,
          ),
        ),
        ...emptyPhotos.map(
          (e) => UiPhotoGalleryModel(
            image: null,
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: (constraints.maxHeight - contentSize) / 2,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: Insets.m,
                        ),
                        child: UIShadow(
                          boxShadow: [
                            BoxShadow(
                              color: context.color.logoGlow,
                              blurRadius: Insets.l,
                            ),
                          ],
                          child: Container(
                            padding: const EdgeInsets.all(Insets.s),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              gradient: context.color.logoGradient,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ProfileI18n.addPhotoHint,
                        style: context.text.smallText.copyWith(
                          color: context.color.smallTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
            loading: false,
            onPressed: context.read<ProfilePhotosCubit>().onPressedAddPhoto,
          ),
        ),
      ],
    );
  }
}
