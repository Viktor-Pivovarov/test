import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:neo_image_editor/neo_image_source_type.dart';
import 'package:neo_image_editor/optimize_settings.dart';
import 'package:permission_handler/permission_handler.dart';

class PhotosCubit<T> extends BaseCubit<T> {
  PhotosCubit(super.initialState, {required PhotosRepository repository})
      : _repository = repository;

  final PhotosRepository _repository;

  List<UiPhotoGalleryModel> onReorder(
    List<UiPhotoGalleryModel> photos,
    int oldIndex,
    int newIndex,
  ) {
    final oldPhotos = [...photos];
    final newPhotos = [...photos];

    if (oldIndex >= photos.length || newIndex >= photos.length) {
      return oldPhotos;
    }

    final element = newPhotos.removeAt(oldIndex);

    newPhotos.insert(newIndex, element);

    return newPhotos;
  }

  Future<List<PhotoEntity>> addPhoto({
    required List<UiPhotoGalleryModel> photos,
    required String title,
    required String description,
    required String mainButtonTitle,
  }) async {
    final result = await SelectImagesHelper.selectImages(
          maxPhotos: 9 - photos.length,
          aspectRatio: JoJoSDKConstants.defaultPhotoAspectRatio,
          sourceType: NeoImageSourceType.gallery,
          optimizeSettings: const OptimizeSettings(
            quality: 70,
          ),
          onPermissionDenied: (type, onClose) {
            return PermissionFullScreenDialog(
              title: title,
              description: description,
              mainButtonTitle: mainButtonTitle,
              secondaryButtonTitle: '',
              onClose: onClose,
              permission: Permission.camera,
            );
          },
        ) ??
        [];

    return result.map((e) => PhotoEntity(image: e, isLoading: true)).toList();
  }

  Future<Either<Failure, (List<PhotoEntity>, List<UiPhotoGalleryModel>)>?>
      uploadPhoto({
    required List<PhotoEntity> tempPhotos,
    required List<UiPhotoGalleryModel> photos,
    void Function(double percent, PhotoEntity photo)? sendProgress,
  }) async {
    final photo = tempPhotos.firstWhereOrNull((element) => !element.hasError);

    if (photo != null) {
      final index = tempPhotos.indexOf(photo);

      final result = await _repository.uploadPhoto(
        photo.image,
        sendProgress: (count, total) {
          final percent = count / total * 100;
          sendProgress?.call(
            percent,
            photo.copyWith(percent: (percent != 100 ? percent : null)),
          );
        },
      );

      return result.fold(
        (error) {
          if (error.code == -1) {
            return Right(
              (
                [...tempPhotos]
                    .whereNotIndexed((i, element) => index == i)
                    .toList(),
                [
                  ...photos,
                ]
              ),
            );
          }

          return Right(
            (
              [...tempPhotos].mapIndexed((i, element) {
                if (index == i) {
                  return element.copyWith(
                    hasError: true,
                    isLoading: false,
                    percent: null,
                  );
                }

                return element;
              }).toList(),
              [
                ...photos,
              ]
            ),
          );
        },
        (r) {
          return Right(
            (
              [...tempPhotos]
                  .whereNotIndexed((i, element) => index == i)
                  .toList(),
              [
                ...photos,
                UiPhotoGalleryModel(
                  id: r.id,
                  image: CachedNetworkImageProvider(r.image),
                  loading: false,
                ),
              ]
            ),
          );
        },
      );
    }

    return null;
  }

  Future<
          Either<(List<PhotoEntity>, List<int>?),
              (List<PhotoEntity>, List<UiPhotoGalleryModel>)>?>
      uploadAllTempPhotos({
    required List<UiPhotoGalleryModel> photos,
    required List<PhotoEntity> tempPhotos,
  }) async {
    final _tempPhotos = [...tempPhotos];

    final uploadingPhoto =
        _tempPhotos.firstWhereOrNull((element) => !element.hasError);

    if (uploadingPhoto == null) {
      return null;
    }

    final index = _tempPhotos.indexOf(uploadingPhoto);

    final result = await _repository.uploadPhoto(uploadingPhoto.image);

    List<PhotoEntity> newTempPhotos = [];
    List<UiPhotoGalleryModel> newPhotos = [];
    List<int>? emptyPhotos;

    return result.fold(
      (error) {
        if (error.code == -1) {
          newTempPhotos =
              tempPhotos.whereNotIndexed((i, element) => i == index).toList();
          emptyPhotos = _repository.generateEmptyPhotos(
            photos.length + (tempPhotos.length - 1),
            9,
          );

          return Left((newTempPhotos, emptyPhotos));
        }

        newTempPhotos = _tempPhotos
            .mapIndexed(
              (i, element) =>
                  element.copyWith(hasError: i == index, isLoading: false),
            )
            .toList();

        uploadAllTempPhotos(photos: photos, tempPhotos: newTempPhotos);

        return Left((newTempPhotos, null));
      },
      (r) {
        _tempPhotos.removeAt(index);

        newTempPhotos = _tempPhotos;

        newPhotos = [
          ...photos,
          UiPhotoGalleryModel(
            id: r.id,
            image: CachedNetworkImageProvider(r.image),
            loading: false,
          ),
        ];

        uploadAllTempPhotos(photos: newPhotos, tempPhotos: newTempPhotos);

        return Right((newTempPhotos, newPhotos));
      },
    );
  }

  // Future<Either<List<PhotoEntity>, (int, PhotoModel)>> uploadPhoto({
  //   required List<PhotoEntity> tempPhotos,
  //   required PhotoEntity photo,
  // }) async {
  //   final _tempPhotos = [...tempPhotos];

  //   final index = _tempPhotos.indexWhere(
  //     (element) => element.image == photo.image,
  //   );

  //   final result = await _repository.uploadPhoto(photo.image);

  //   return result.fold(
  //     (e) {
  //       return Left(
  //         _tempPhotos
  //             .mapIndexed(
  //               (index, element) =>
  //                   element.copyWith(hasError: true, isLoading: false),
  //             )
  //             .toList(),
  //       );
  //     },
  //     (r) async {
  //       _tempPhotos.removeAt(index);

  //       return Right((index, r));
  //     },
  //   );
  // }
}
