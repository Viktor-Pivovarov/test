import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'profile_photos_cubit.freezed.dart';
part 'profile_photos_state.dart';

class ProfilePhotosCubit extends PhotosCubit<ProfilePhotosState> {
  ProfilePhotosCubit({
    required this.authManager,
    required PhotosRepository photosRepository,
    required NotifyService notifyService,
  })  : _notifyService = notifyService,
        _photosRepository = photosRepository,
        super(const ProfilePhotosState(), repository: photosRepository) {
    _stream = authManager.currentUser.listen(_listenAuth);
  }

  final NotifyService _notifyService;

  final PhotosRepository _photosRepository;

  final AuthManager<AuthenticatedUser> authManager;

  StreamSubscription<AuthenticatedUser>? _stream;

  void _listenAuth(AuthenticatedUser user) {
    emit(
      state.copyWith(
        photos: user.profile.photos
            .map(
              (e) => UiPhotoGalleryModel(
                id: e.id,
                image: CachedNetworkImageProvider(e.image),
                loading: false,
              ),
            )
            .toList(),
        emptyPhotos: _photosRepository.generateEmptyPhotos(
          user.profile.photos.length + state.tempPhotos.length,
          9,
        ),
      ),
    );
  }

  void emitUpdate() {
    GetIt.I<EventBus>().fire(UpdateUser());
  }

  Future<void> onReorderPhotos(int oldIndex, int newIndex) async {
    final oldPhotos = [...state.photos];
    final photos = onReorder(state.photos, oldIndex, newIndex);

    emit(state.copyWith(photos: photos));

    try {
      await _photosRepository.sortPhotos(
        SortPhotosRequestDTO(
          sortedPhotos: photos
              .mapIndexed(
                (index, e) => SortPhotoItemDTO(id: e.id!, position: index + 1),
              )
              .toList(),
        ),
      );

      emitUpdate();
    } catch (_) {
      emit(state.copyWith(photos: oldPhotos));
    }
  }

  Future<void> onPressedDeleteTempPhoto(int index) async {
    if (state.tempPhotos.elementAt(index).isLoading) {
      return GetIt.I<DioApiClient>().cancelToken.cancel();
    }

    emit(
      state.copyWith(
        tempPhotos: state.tempPhotos
            .whereNotIndexed((i, element) => i == index)
            .toList(),
        emptyPhotos: _photosRepository.generateEmptyPhotos(
          state.photos.length + (state.tempPhotos.length - 1),
          9,
        ),
      ),
    );
  }

  Future<void> onPressedDeletePhoto(int index) async {
    final id = state.photos.elementAt(index).id;

    if (state.photos.length == 2) {
      await const PhotoFreezeDialog().show();
    }

    emit(
      state.copyWith(
        photos: state.photos.map((e) {
          return e.copyWith(loading: e.id == id);
        }).toList(),
      ),
    );

    final result = await _photosRepository.deletePhoto(id!);

    result.fold((error) {
      _notifyService.showError(error.message ?? error.getLocalizedString());
    }, (r) {
      // authManager.user = authManager.user.copyWith(
      //   profile: authManager.user.profile.copyWith(
      //     photos: [
      //       ...authManager.user.profile.photos
      //           .whereNot((element) => element.id == id),
      //     ],
      //   ),
      // );

      emitUpdate();
    });
  }

  Future<void> onPressedAddPhoto() async {
    if (state.status.isFetchingInProgress) {
      return;
    }

    final result = await addPhoto(
      photos: state.photos,
      title: SignUpI18n.permissionCameraTitle,
      description: SignUpI18n.permissionCameraDescription,
      mainButtonTitle: SignUpI18n.openSettingsBtn,
    );

    if (result.isEmpty) {
      return;
    }

    emit(
      state.copyWith(
        tempPhotos: result,
        emptyPhotos: _photosRepository.generateEmptyPhotos(
          result.length + state.photos.length,
          9,
        ),
      ),
    );

    await _uploadPhotos();
  }

  Future<void> onPressedRepeatUploadPhoto(PhotoEntity value) async {
    if (state.tempPhotos.where((element) => element.isLoading).isNotEmpty) {
      return;
    }

    emit(
      state.copyWith(
        tempPhotos: state.tempPhotos.map((element) {
          if (element == value) {
            return element.copyWith(hasError: false, isLoading: true);
          }

          return element;
        }).toList(),
      ),
    );

    await _uploadPhotos();
  }

  Future<void> _uploadPhotos() async {
    final result = await uploadPhoto(
      photos: state.photos,
      tempPhotos: state.tempPhotos,
      sendProgress: (double percent, PhotoEntity photo) {
        emit(
          state.copyWith(
            tempPhotos: state.tempPhotos.mapIndexed((i, element) {
              if (element.image == photo.image) {
                return photo;
              }

              return element;
            }).toList(),
          ),
        );
      },
    );

    result?.fold((l) => null,
        ((List<PhotoEntity>, List<UiPhotoGalleryModel>) r) {
      emit(
        state.copyWith(
          tempPhotos: r.$1,
          photos: r.$2,
          emptyPhotos: _photosRepository.generateEmptyPhotos(
            r.$1.length + r.$2.length,
            9,
          ),
        ),
      );

      emitUpdate();
    });

    if (result != null) {
      await _uploadPhotos();
    }
  }

  @override
  Future<void> close() {
    _stream?.cancel();

    return super.close();
  }
}
