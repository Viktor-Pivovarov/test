import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:x_logger/x_logger.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  SignUpRepositoryImpl(this._dataSource, this._logger);

  final RestSignUpDataSource _dataSource;

  final XLogger _logger;

  List<PhotoModel> _sortPhotos(List<PhotoModel> items) {
    final List<PhotoModel> photos = [...items]
      ..sort((a, b) => a.position.compareTo(b.position));

    return photos;
  }

  @override
  Future<Either<Failure, WorksheetStepsResponseModel>>
      getWorksheetSteps() async {
    try {
      final result = await _dataSource.getWorksheetSteps();

      return Right(result);
    } catch (_) {}

    return Left(HttpFailure(HttpCodes.forbidden, code: 0, message: ''));
  }

  @override
  Future<Either<Failure, List<PhotoModel>>> getPhotos() async {
    try {
      final response = await _dataSource.getPhotos();

      return Right(_sortPhotos(response.items));
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed sortPhotos',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        ProfileFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed sortPhotos', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CityModel>>> getCities(String q) async {
    try {
      final response = await _dataSource.getCities(q);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed getCities',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed getCities', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, PhotoModel>> setBiometrics(List<int> image) async {
    try {
      final response = await _dataSource.setBiometrics(image);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setBiometrics',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setBiometrics', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setBiometricsIncrement() async {
    try {
      final response = await _dataSource.setBiometricsIncrement();

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setBiometricsIncrement',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setBiometricsIncrement', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setBirthday(String birthday) async {
    try {
      final response = await _dataSource.setBirthday(birthday);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setBirthday',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setBirthday', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setBirthTime(String birthTime) async {
    try {
      final response = await _dataSource.setBirthTime(birthTime);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setBirthTime',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setBirthTime', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setCityBorn(LocationModel location) async {
    try {
      final response = await _dataSource.setCityBorn(location);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setCityBorn',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setCityBorn', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setComplete() async {
    try {
      final response = await _dataSource.complete();

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e('Failed setComplete', error.errorResponseMessage, stacktrace);

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setComplete', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setFirstName(String firstName) async {
    try {
      final response = await _dataSource.setFirstName(firstName);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setFirstName',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setFirstName', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setHeight(int height) async {
    try {
      final response = await _dataSource.setHeight(height);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setHeight',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setHeight', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setLanguages(List<int> languages) async {
    try {
      final response = await _dataSource.setLanguages(languages);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setLanguages',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.response!.statusCode!,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setLanguages', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, PhotoModel>> setPhoto(
    List<int> image,
  ) async {
    try {
      final response = await _dataSource.setPhoto(image);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setPhoto',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(AuthFailure(code: -1, message: error.toString()));
    } catch (error, stacktrace) {
      _logger.e('Failed setPhoto', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePhoto(
    int id,
  ) async {
    try {
      final response = await _dataSource.deletePhoto(id);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed deletePhoto',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(AuthFailure(code: -1, message: error.toString()));
    } catch (error, stacktrace) {
      _logger.e('Failed deletePhoto', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setPhotosIncrement() async {
    try {
      final response = await _dataSource.setPhotosIncrement();

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setPhotosIncrement',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setPhotosIncrement', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setSearchAge(int ageFrom, int ageTo) async {
    try {
      final response = await _dataSource.setSearchAge(ageFrom, ageTo);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setSearchAge',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(AuthFailure(code: -1, message: error.toString()));
    } catch (error, stacktrace) {
      _logger.e('Failed setSearchAge', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setSearchHeight(
    int heightFrom,
    int heightTo,
  ) async {
    try {
      final response = await _dataSource.setSearchHeight(heightFrom, heightTo);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setSearchHeight',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(AuthFailure(code: -1, message: error.toString()));
    } catch (error, stacktrace) {
      _logger.e('Failed setSearchHeight', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setLocationCoordinate(LocationDTO data) async {
    return const Right(null);
    // try {
    //   final response = await _dataSource.setLocationCoordinate(data);

    //   return Right(response);
    // } on DioException catch (error, stacktrace) {
    //   _logger.e('Failed setLocationCoordinate', error, stacktrace);

    //   return Left(
    //     AuthFailure(
    //       code: error.errorResponseCode,
    //       message: error.errorMessage,
    //     ),
    //   );
    // } catch (error, stacktrace) {
    //   _logger.e('Failed setLocationCoordinate', error, stacktrace);

    //   return Left(AuthFailure(code: -1, message: error.toString()));
    // }
  }

  @override
  Future<Either<Failure, void>> welcome() async {
    try {
      final response = await _dataSource.welcome();

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e('Failed welcome', error.errorResponseMessage, stacktrace);

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed welcome', error, stacktrace);

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sortPhotos(
    SortPhotosRequestDTO data,
  ) async {
    try {
      await _dataSource.sortPhotos(data);

      return const Right(null);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed sortPhotos',
        error.errorResponseMessage,
        stacktrace,
      );

      return Left(
        ProfileFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed sortPhotos', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }
}
