part of 'photos_cubit.dart';

@freezed
class PhotosStepState with _$PhotosStepState {
  const factory PhotosStepState.initial({
    @Default(<UiPhotoGalleryModel>[]) List<UiPhotoGalleryModel> photos,
    @Default(<PhotoEntity>[]) List<PhotoEntity> tempPhotos,
    @Default(<int>[]) List<int> emptyPhotos,
    @Default(StateStatus.pure) StateStatus status,
    @Default(true) bool isEditing,
    @Default(false) bool isValid,
    AuthenticatedUser? user,
  }) = _Initial;

  const PhotosStepState._();

  bool get canUpload {
    return photos.length + tempPhotos.length < 9;
  }
}
