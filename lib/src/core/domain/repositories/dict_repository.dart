import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

/// Списки классификаторов.
abstract class DictRepository {
  Future<Either<Failure, List<DictModel>>> getAlcoholStatuses({
    bool refresh = false,
  });
  Future<Either<Failure, List<DictModel>>> getEducations({
    bool refresh = false,
  });
  Future<Either<Failure, List<DictModel>>> getFamilyPlans({
    bool refresh = false,
  });
  Future<Either<Failure, List<DictModel>>> getFoodPreferences({
    bool refresh = false,
  });
  Future<Either<Failure, List<DictModel>>> getIdealMeetingPoints({
    bool refresh = false,
  });
  Future<Either<Failure, List<DictModel>>> getLanguages({bool refresh = false});
  Future<Either<Failure, List<DictModel>>> getPets({bool refresh = false});
  Future<Either<Failure, List<DictModel>>> getProfessionalStatuses({
    bool refresh = false,
  });
  Future<Either<Failure, List<DictModel>>> getReligions({bool refresh = false});
  Future<Either<Failure, List<DictModel>>> getSleepHabits({
    bool refresh = false,
  });
  Future<Either<Failure, List<DictModel>>> getSmokeStatuses({
    bool refresh = false,
  });
  Future<Either<Failure, List<DictModel>>> getSpheres({bool refresh = false});
  Future<Either<Failure, List<DictModel>>> getWorkouts({bool refresh = false});
  Future<Either<Failure, List<DictModel>>> getCovid({bool refresh = false});
  Future<Either<Failure, List<DictModel>>> getComplainReasons({
    bool refresh = false,
  });

  Future<Either<Failure, List<InterestModel>>> getInterests({
    bool refresh = false,
  });
}
