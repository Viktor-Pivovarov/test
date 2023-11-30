import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class PhotosRepositoryImpl implements PhotosRepository {
  PhotosRepositoryImpl({
    required PhotosDataSource dataSource,
  }) : _dataSource = dataSource;

  final PhotosDataSource _dataSource;

  @override
  Future<Either<Failure, PhotoModel>> uploadPhoto(
    List<int> image, {
    ProgressCallback? sendProgress,
  }) async {
    // final int random = Random().nextInt(4);
    // final bool isEven = random.isEven;
    // print('$random: $isEven');
    // if (isEven) {
    //   await Future<void>.delayed(const Duration(seconds: 2));

    //   return Left(ProfileFailure(code: 0, message: 'Error'));
    // }

    try {
      final response = await _dataSource.uploadPhoto(
        image,
        sendProgress: sendProgress,
      );

      return Right(response);
    } on DioException catch (error) {
      if (error.type == DioExceptionType.cancel) {
        return Left(
          ProfileFailure(
            code: -1,
            message: error.errorResponseMessage,
          ),
        );
      }

      return Left(
        ProfileFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ProfileFailure(code: 0, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePhoto(int id) async {
    try {
      final response = await _dataSource.deletePhoto(id);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        ProfileFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  List<int> generateEmptyPhotos(int count, int itemInRow) {
    if (count == 9) {
      return [];
    }

    return List.generate(itemInRow - (count % itemInRow), (index) => index);
  }

  @override
  Future<Either<Failure, List<PhotoModel>>> getPhotos() async {
    try {
      final response = await _dataSource.getPhotos();

      return Right(response.items);
    } on DioException catch (error) {
      return Left(
        ProfileFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sortPhotos(SortPhotosRequestDTO data) async {
    try {
      await _dataSource.sortPhotos(data);

      return const Right(null);
    } on DioException catch (error) {
      return Left(
        ProfileFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }
}
