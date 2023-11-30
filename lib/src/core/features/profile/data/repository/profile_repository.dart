import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:x_logger/x_logger.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({
    required ProfileDataSource dataSource,
    required XLogger logger,
    required AuthManager<AuthenticatedUser> authManager,
  })  : _dataSource = dataSource,
        _logger = logger,
        _authManager = authManager;

  final ProfileDataSource _dataSource;

  final AuthManager<AuthenticatedUser> _authManager;

  final XLogger _logger;

  AuthenticatedUser _sortPhotos(AuthenticatedUser user) {
    final List<PhotoModel> photos = [...user.profile.photos]
      ..sort((a, b) => a.position.compareTo(b.position));

    return user.copyWith(profile: user.profile.copyWith(photos: photos));
  }

  @override
  Future<Either<Failure, void>> getUserInfo() async {
    try {
      final response = await _dataSource.getUserInfo();

      _authManager.user = _sortPhotos(response);

      return const Right(null);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateBirthday',
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
      _logger.e('Failed updateBirthday', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateBirthday(DateTime value) async {
    try {
      final response = await _dataSource.updateBirthday(value.toString());

      await getUserInfo();

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateBirthday',
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
      _logger.e('Failed updateBirthday', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateHeight(int value) async {
    try {
      final response = await _dataSource.updateHeight(value);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   searcher: _authManager.user.searcher.copyWith(height: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateHeight',
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
      _logger.e('Failed updateHeight', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateEducation(DictModel value) async {
    try {
      final response = await _dataSource.updateEducation(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(education: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateEducation',
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
      _logger.e('Failed updateEducation', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateBirthTime(
    String value, {
    bool isBirthTimeKnown = false,
  }) async {
    try {
      final response = await _dataSource.updateBirthTime(value);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   vedic: _authManager.user.vedic.copyWith(birthtime: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateBirthTime',
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
      _logger.e('Failed updateBirthTime', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCityBorn(LocationModel location) async {
    try {
      final response = await _dataSource.updateCityBorn(location);

      await getUserInfo();
      // _authManager.user = _authManager.user.copyWith(
      //   vedic: _authManager.user.vedic.copyWith(
      //     birthLocation: location,
      //   ),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateCityBorn',
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
      _logger.e('Failed updateCityBorn', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateLanguages(List<DictModel> value) async {
    try {
      final response =
          await _dataSource.updateLanguages(value.map((e) => e.id).toList());

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(languages: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateLanguages',
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
      _logger.e('Failed updateLanguages', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateDistance(int value) async {
    try {
      final response = await _dataSource.updateDistance(value);

      await getUserInfo();

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateDistance',
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
      _logger.e('Failed updateLanguages', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, PhotoModel>> uploadPhoto(
    List<int> image,
  ) async {
    // await Future<void>.delayed(const Duration(seconds: 5));

    // return Left(ProfileFailure(code: -1, message: 'Ошибка'));

    try {
      final response = await _dataSource.uploadPhoto(image);

      await Future<void>.delayed(const Duration(seconds: 2));

      await getPhotos();

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed uploadPhoto',
        error.errorResponseMessage,
        stacktrace,
      );

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
    } catch (error, stacktrace) {
      _logger.e('Failed uploadPhoto', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePhoto(
    int id,
  ) async {
    try {
      final response = await _dataSource.deletePhoto(id);

      await getPhotos();

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed deletePhoto',
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
      _logger.e('Failed deletePhoto', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateFirstName(String value) async {
    try {
      final response = await _dataSource.updateFirstName(value);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(firstName: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateFirstName',
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
      _logger.e('Failed updateFirstName', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfessionalStatus(
    DictModel value,
  ) async {
    try {
      final response = await _dataSource.updateProfessionalStatus(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(professionalStatus: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateProfessionalStatus',
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
      _logger.e('Failed updateProfessionalStatus', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateSphere(DictModel value) async {
    try {
      final response = await _dataSource.updateSphere(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(sphere: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateSphere',
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
      _logger.e('Failed updateSphere', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateReligion(DictModel value) async {
    try {
      final response = await _dataSource.updateReligion(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(religion: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateReligion',
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
      _logger.e('Failed updateReligion', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateFamilyPlan(DictModel value) async {
    try {
      final response = await _dataSource.updateFamilyPlan(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(familyPlan: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateFamilyPlan',
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
      _logger.e('Failed updateFamilyPlan', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCovid(DictModel value) async {
    try {
      final response = await _dataSource.updateCovid(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(covid: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateCovid',
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
      _logger.e('Failed updateCovid', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateSmokeStatus(DictModel value) async {
    try {
      final response = await _dataSource.updateSmokeStatus(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(smokeStatus: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateSmokeStatus',
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
      _logger.e('Failed updateSmokeStatus', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateFoodPreference(DictModel value) async {
    try {
      final response = await _dataSource.updateFoodPreference(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(foodPreference: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateFoodPreference',
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
      _logger.e('Failed updateFoodPreference', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAlcoholStatus(DictModel value) async {
    try {
      final response = await _dataSource.updateAlcoholStatus(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(alcoholStatus: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateAlcoholStatus',
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
      _logger.e('Failed updateAlcoholStatus', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateWorkout(DictModel value) async {
    try {
      final response = await _dataSource.updateWorkout(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(workout: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateWorkout',
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
      _logger.e('Failed updateWorkout', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateSleepHabit(DictModel value) async {
    try {
      final response = await _dataSource.updateSleepHabit(value.id);

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(sleepHabit: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateSleepHabit',
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
      _logger.e('Failed updateSleepHabit', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePets(List<DictModel> value) async {
    try {
      final response =
          await _dataSource.updatePets(value.map((e) => e.id).toList());

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(pets: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updatePets',
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
      _logger.e('Failed updatePets', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateInterests(List<DictModel> value) async {
    try {
      final response =
          await _dataSource.updateInterests(value.map((e) => e.id).toList());

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(interests: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updatePets',
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
      _logger.e('Failed updatePets', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateIdealMeetingPoints(
    List<DictModel> value,
  ) async {
    try {
      final response = await _dataSource
          .updateIdealMeetingPoints(value.map((e) => e.id).toList());

      await getUserInfo();

      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(idealMeetingPoints: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateIdealMeetingPoints',
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
      _logger.e('Failed updateIdealMeetingPoints', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAboutMe(String value) async {
    try {
      final response = await _dataSource.updateAboutMe(value);

      await getUserInfo();
      // _authManager.user = _authManager.user.copyWith(
      //   profile: _authManager.user.profile.copyWith(bio: value),
      // );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateAboutMe',
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
      _logger.e('Failed updateAboutMe', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
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

  @override
  Future<Either<Failure, List<PhotoModel>>> getPhotos() async {
    try {
      final response = await _dataSource.getPhotos();

      _authManager.user = _sortPhotos(
        _authManager.user.copyWith(
          profile: _authManager.user.profile.copyWith(photos: response.items),
        ),
      );

      return Right(response.items);
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
  Future<Either<Failure, void>> updateFCMToken(String token) async {
    try {
      final response = await _dataSource.updateFCMToken(token);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed updateFCMToken',
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
      _logger.e('Failed updateFCMToken', error, stacktrace);

      return Left(ProfileFailure(code: -1, message: error.toString()));
    }
  }
}
