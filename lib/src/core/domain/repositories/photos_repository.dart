import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

abstract class PhotosRepository {
  Future<Either<Failure, List<PhotoModel>>> getPhotos();

  Future<Either<Failure, PhotoModel>> uploadPhoto(
    List<int> image, {
    ProgressCallback? sendProgress,
  });

  Future<Either<Failure, void>> deletePhoto(int id);

  Future<Either<Failure, void>> sortPhotos(SortPhotosRequestDTO data);

  List<int> generateEmptyPhotos(int count, int itemInRow);
}
