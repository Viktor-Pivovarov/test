import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:neo_image_editor/neo_image_source_type.dart';
import 'package:neo_image_editor/optimize_settings.dart';
import 'package:permission_handler/permission_handler.dart';

part 'photos_cubit.freezed.dart';
part 'photos_state.dart';

class PhotosStepCubit extends Cubit<PhotosStepState>
    implements AbstractRegisterStep {
  PhotosStepCubit({
    required SignUpRepository repository,
    required PhotosRepository photosRepository,
    required GetUserCase getUserCase,
    required AuthManager<AuthenticatedUser> authManager,
    required AuthRouter router,
    required NotifyService notifyService,
  })  : _repository = repository,
        _photosRepository = photosRepository,
        _getUserCase = getUserCase,
        _authManager = authManager,
        _router = router,
        _notifyService = notifyService,
        super(const PhotosStepState.initial());

  static StepEnum id = StepEnum.photo;

  final NotifyService _notifyService;

  final SignUpRepository _repository;

  final PhotosRepository _photosRepository;

  final GetUserCase _getUserCase;

  final AuthManager<AuthenticatedUser> _authManager;

  final AuthRouter _router;

  final FormControl<String> formControl = FormControl<String>(
    validators: <Validator<dynamic>>[Validators.required],
  );

  late void Function([AuthenticatedUser? data, StepEnum? id]) _onFinish;

  StreamSubscription<AuthenticatedUser>? _stream;

  Future<void> _save() async {
    final result = await _repository.setPhotosIncrement();

    result.fold((error) {
      _notifyService.showError(error.message ?? '');
    }, (r) {
      emit(
        state.copyWith(isEditing: false),
      );
      _onFinish(
        state.user,
        id,
      );
    });
  }

  @override
  List<StepWidget> children() => <StepWidget>[
        StepWidget(
          typingDuration: 1000,
          readingDuration: 3000,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.infoAboutHumanMessage,
          ),
        ),
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(content: SignUpI18n.uploadPhotosMessage),
        ),
        StepWidget(
          typingDuration: 0,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: BlocBuilder<PhotosStepCubit, PhotosStepState>(
            bloc: this,
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  if (state.isEditing) ...[
                    UiPhotoGallery(
                      onReorder: onReorderPhotos,
                      items: [
                        ...state.photos.asMap().entries.map(
                              (entry) => entry.value.copyWith(
                                onPressedDelete: entry.value.loading
                                    ? null
                                    : () => _onPressedDelete(entry.key),
                              ),
                            ),
                        ...state.tempPhotos.map(
                          (e) => UiPhotoGalleryModel(
                            image: MemoryImage(Uint8List.fromList(e.image)),
                            loading: e.isLoading,
                            hasError: e.hasError,
                            onPressedDelete: () => onPressedDeleteTempPhoto(
                              state.tempPhotos.indexOf(e),
                            ),
                            onPressedRepeat: e.hasError
                                ? () => onPressedRepeatUploadPhoto(e)
                                : null,
                          ),
                        ),
                        ...state.emptyPhotos.map(
                          (e) => UiPhotoGalleryModel(
                            image: null,
                            child: const Center(child: Icon(Icons.add)),
                            loading: false,
                            onPressed: onPressedAddPhoto,
                          ),
                        ),
                      ],
                    ),
                    if (state.canUpload)
                      UiButton.outline(
                        text: SignUpI18n.photoBtn,
                        onPressed: onPressedAddPhoto,
                        suffixIcon: UiIcon(Assets.icons.iPhoto),
                      ),
                    UiButton(
                      disabled: state.photos.length < 2,
                      text: SignUpI18n.confirmBtn,
                      onPressed: _save,
                      suffixIcon: UiIcon(Assets.icons.iCheck),
                    ),
                  ] else ...[
                    UiAnswerMessage(
                      onPressed: () {
                        emit(
                          state.copyWith(isEditing: true),
                        );
                      },
                      child: UiPhotoGallery(
                        items: [
                          ...state.photos.asMap().entries.map(
                                (entry) => entry.value.copyWith(
                                  onPressedDelete: entry.value.loading
                                      ? null
                                      : () => _onPressedDelete(entry.key),
                                ),
                              ),
                          ...state.tempPhotos.mapIndexed(
                            (index, e) => UiPhotoGalleryModel(
                              image: MemoryImage(Uint8List.fromList(e.image)),
                              loading: e.isLoading,
                              hasError: e.hasError,
                            ),
                          ),
                        ],
                        // TODO(Alex): не работает disable
                        disabled: !state.isEditing,
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ];

  Future<void> onPressedDeleteTempPhoto(int index) async {
    if (state.tempPhotos.elementAt(index).isLoading) {
      return GetIt.I<DioApiClient>().cancelToken.cancel();
    }

    emit(
      state.copyWith(
        tempPhotos: state.tempPhotos
            .whereNotIndexed((i, element) => i == index)
            .toList(),
      ),
    );
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

    await _uploadPhoto(value);
  }

  Future<void> _uploadPhoto(PhotoEntity photo) async {
    final photos = [...state.tempPhotos];

    final index = photos.indexWhere(
      (element) => element.image == photo.image,
    );

    final result = await _repository.setPhoto(photo.image);

    await result.fold(
      (e) {
        emit(
          state.copyWith(
            tempPhotos: photos
                .mapIndexed(
                  (index, element) =>
                      element.copyWith(hasError: true, isLoading: false),
                )
                .toList(),
          ),
        );
      },
      (r) async {
        photos.removeAt(index);

        emit(
          state.copyWith(
            tempPhotos: photos,
            photos: [
              ...state.photos,
              UiPhotoGalleryModel(
                id: r.id,
                image: CachedNetworkImageProvider(r.image),
                loading: false,
              ),
            ],
          ),
        );

        await _repository.getPhotos();
      },
    );
  }

  Future<void> onReorderPhotos(int oldIndex, int newIndex) async {
    if (oldIndex >= state.photos.length || newIndex >= state.photos.length) {
      return;
    }

    final oldPhotos = [...state.photos];
    final photos = [...state.photos];

    final element = photos.removeAt(oldIndex);

    photos.insert(newIndex, element);

    emit(state.copyWith(photos: photos));

    try {
      await _repository.sortPhotos(
        SortPhotosRequestDTO(
          sortedPhotos: photos
              .mapIndexed(
                (index, e) => SortPhotoItemDTO(id: e.id!, position: index + 1),
              )
              .toList(),
        ),
      );

      final result = await _repository.getPhotos();

      result.fold((l) => null, (r) {
        emit(
          state.copyWith(
            photos: r
                .map(
                  (e) => UiPhotoGalleryModel(
                    id: e.id,
                    image: CachedNetworkImageProvider(e.image),
                    loading: false,
                  ),
                )
                .toList(),
          ),
        );
      });
    } catch (_) {
      emit(state.copyWith(photos: oldPhotos));
    }
  }

  Future<void> onPressedAddPhoto() async {
    if (state.status.isFetchingInProgress) {
      return;
    }

    final result = await SelectImagesHelper.selectImages(
          maxPhotos: 9 - [...state.tempPhotos, ...state.photos].length,
          aspectRatio: JoJoSDKConstants.defaultPhotoAspectRatio,
          sourceType: NeoImageSourceType.gallery,
          onPermissionDenied: (type, onClose) {
            return PermissionFullScreenDialog(
              title: SignUpI18n.permissionPhotosTitle,
              description: SignUpI18n.permissionPhotosDescription,
              mainButtonTitle: SignUpI18n.openSettingsBtn,
              secondaryButtonTitle: SignUpI18n.abortRegistrationBtn,
              onClose: onClose,
              permission: Permission.photos,
              onSecondaryTap: logout,
            );
          },
          optimizeSettings: const OptimizeSettings(
            quality: 70,
          ),
        ) ??
        [];

    if (result.isEmpty) {
      return;
    }

    emit(
      state.copyWith(
        tempPhotos:
            result.map((e) => PhotoEntity(image: e, isLoading: true)).toList(),
        emptyPhotos: _photosRepository.generateEmptyPhotos(
          result.length + [...state.tempPhotos, ...state.photos].length,
          3,
        ),
      ),
    );

    await _uploadPhotos();
  }

  Future<void> logout() async {
    await _authManager.signOut();
    await _router.replaceNamed(RoutePath.initial);
  }

  Future<void> _uploadPhotos() async {
    final photos = [...state.tempPhotos];

    if (photos.isEmpty) {
      return;
    }

    final uploadingPhoto =
        photos.firstWhereOrNull((element) => !element.hasError);

    if (uploadingPhoto == null) {
      return;
    }

    final index = photos.indexOf(uploadingPhoto);

    final result = await _repository.setPhoto(uploadingPhoto.image);

    result.fold(
      (e) {
        if (e.code == -1) {
          emit(
            state.copyWith(
              tempPhotos: state.tempPhotos
                  .whereNotIndexed((i, element) => i == index)
                  .toList(),
              emptyPhotos: _photosRepository.generateEmptyPhotos(
                state.photos.length + (state.tempPhotos.length - 1),
                3,
              ),
            ),
          );

          return;
        }

        emit(
          state.copyWith(
            tempPhotos: photos
                .mapIndexed(
                  (index, element) =>
                      element.copyWith(hasError: true, isLoading: false),
                )
                .toList(),
          ),
        );
      },
      (r) {
        photos.removeAt(index);

        emit(
          state.copyWith(
            photos: [
              ...state.photos,
              UiPhotoGalleryModel(
                id: r.id,
                image: CachedNetworkImageProvider(r.image),
                loading: false,
              ),
            ],
            tempPhotos: photos,
            emptyPhotos: _photosRepository.generateEmptyPhotos(
              state.photos.length + 1 + photos.length,
              3,
            ),
            user: state.user?.copyWith(
              profile: state.user!.profile
                  .copyWith(photos: [...state.user!.profile.photos, r]),
            ),
          ),
        );

        _uploadPhotos();
      },
    );
  }

  Future<void> _onPressedDelete(int index) async {
    emit(
      state.copyWith(
        photos: state.photos.map((e) {
          if (e == state.photos.elementAt(index)) {
            return e.copyWith(loading: true);
          }

          return e;
        }).toList(),
      ),
    );

    final result = await _repository
        .deletePhoto(state.user!.profile.photos.elementAt(index).id);

    result.fold(print, (r) {
      final photos = [
        ...state.photos
            .whereNotIndexed((itemIndex, element) => index == itemIndex),
      ];

      emit(
        state.copyWith(
          photos: photos,
          emptyPhotos: _photosRepository.generateEmptyPhotos(photos.length, 3),
        ),
      );
    });
  }

  @override
  Future<void> init(
    StepEnum? initStep,
    void Function(
      List<StepWidget>? children, {
      bool useDuration,
    }) addChildren,
    void Function([AuthenticatedUser? data, StepEnum? id]) onFinish,
  ) async {
    _onFinish = onFinish;

    final result = await _getUserCase(NoParams());

    _stream = result.listen(
      (user) {
        if (state.status.isPure) {
          final value = user.profile.photos;
          final isInitValue = value.isEmpty;

          addChildren(
            children(),
            useDuration: isInitValue,
          );

          if (!isInitValue && initStep != id) {
            onFinish();
          }

          emit(
            state.copyWith(
              user: user,
              isEditing: isInitValue || initStep == id,
              status: StateStatus.fetchingSuccess,
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
                user.profile.photos.length,
                3,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() async {
    await _stream?.cancel();
    await super.close();
  }
}
