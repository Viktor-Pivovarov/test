part of 'profile_photos_cubit.dart';

@freezed
class ProfilePhotosState with _$ProfilePhotosState {
  const factory ProfilePhotosState({
    @Default(StateStatus.pure) StateStatus status,
    @Default(<UiPhotoGalleryModel>[]) List<UiPhotoGalleryModel> photos,
    @Default(<PhotoEntity>[]) List<PhotoEntity> tempPhotos,
    @Default(<int>[]) List<int> emptyPhotos,
  }) = _Initial;

  const ProfilePhotosState._();

  int get allPhotosLength => [...photos, ...tempPhotos, ...emptyPhotos].length;
}
