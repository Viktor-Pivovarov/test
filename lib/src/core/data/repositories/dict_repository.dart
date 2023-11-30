import 'package:get_it/get_it.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:x_logger/x_logger.dart';

class DictRepositoryImpl implements DictRepository {
  DictRepositoryImpl(this._dataSource, this._dictsCacheDataSource);

  final DictDataSource _dataSource;
  final DictsCacheDataSource _dictsCacheDataSource;

  final XLogger _logger = GetIt.I(param1: DictRepositoryImpl);

  @override
  Future<Either<Failure, List<DictModel>>> getAlcoholStatuses({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.alcohol);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getAlcoholStatuses();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.alcohol, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getAlcoholStatuses', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getAlcoholStatuses', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getEducations({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.educations);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getEducations();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.educations, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getEducations', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getEducations', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getFamilyPlans({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.familyPlans);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getFamilyPlans();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.familyPlans, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getFamilyPlans', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getFamilyPlans', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getFoodPreferences({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.foodPreferences);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getFoodPreferences();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.foodPreferences, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getFoodPreferences', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getFoodPreferences', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getIdealMeetingPoints({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items =
            await _dictsCacheDataSource.getDict(DictEnum.idealMeetingPoints);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getIdealMeetingPoints();

        items = response.items;

        await _dictsCacheDataSource.saveDict(
          DictEnum.idealMeetingPoints,
          items,
        );
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getIdealMeetingPoints', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getIdealMeetingPoints', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getLanguages({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.languages);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getLanguages();

        items = response.items;

        await _dictsCacheDataSource.saveDict(
          DictEnum.languages,
          items,
        );
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getLanguages', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getLanguages', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getPets({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.pets);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getPets();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.pets, items);
      }

      return Right([
        ...items.where((element) => element.code == 'none'),
        ...items.whereNot((element) => element.code == 'none'),
      ]);
    } on DioException catch (error, stacktrace) {
      _logger.e('getPets', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getPets', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getProfessionalStatuses({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.professional);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getProfessionalStatuses();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.professional, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getProfessionalStatuses', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getProfessionalStatuses', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getReligions({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.religions);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getReligions();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.religions, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getReligions', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getReligions', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getSleepHabits({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.sleepHabits);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getSleepHabits();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.sleepHabits, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getSleepHabits', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getSleepHabits', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getSmokeStatuses({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.smokeStatuses);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getSmokeStatuses();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.smokeStatuses, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getSmokeStatuses', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getSmokeStatuses', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getSpheres({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.spheres);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getSpheres();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.spheres, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getSpheres', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getSpheres', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getWorkouts({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.workouts);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getWorkouts();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.workouts, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getWorkouts', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getWorkouts', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getCovid({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.covid);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getCovid();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.covid, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getCovid', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getCovid', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getComplainReasons({
    bool refresh = false,
  }) async {
    try {
      List<DictModel> items = [];

      if (!refresh) {
        items = await _dictsCacheDataSource.getDict(DictEnum.complainReasons);
      }

      if (items.isEmpty) {
        final response = await _dataSource.getComplainReasons();

        items = response.items;

        await _dictsCacheDataSource.saveDict(DictEnum.complainReasons, items);
      }

      return Right(items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getComplainReasons', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getComplainReasons', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<InterestModel>>> getInterests({
    bool refresh = false,
  }) async {
    try {
      final response = await _dataSource.getInterests();

      return Right(response.items);
    } on DioException catch (error, stacktrace) {
      _logger.e('getInterests', error.message, stacktrace);

      return Left(
        DictFailure(
          code: error.response?.statusCode ?? 0,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('getInterests', error, stacktrace);

      return Left(DictFailure(code: 1, message: error.toString()));
    }
  }
}
