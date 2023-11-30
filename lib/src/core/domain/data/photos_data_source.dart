import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

abstract class PhotosDataSource {
  Future<PhotosResponseDTO> getPhotos();

  Future<PhotoModel> uploadPhoto(
    List<int> image, {
    ProgressCallback? sendProgress,
  });

  Future<void> deletePhoto(int id);

  Future<void> sortPhotos(SortPhotosRequestDTO data);
}
