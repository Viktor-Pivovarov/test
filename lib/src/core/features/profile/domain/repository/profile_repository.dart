import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> getUserInfo();

  Future<Either<Failure, void>> updateBirthday(DateTime value);

  Future<Either<Failure, void>> updateHeight(int value);

  Future<Either<Failure, void>> updateBirthTime(
    String value, {
    bool isBirthTimeKnown = false,
  });

  Future<Either<Failure, void>> updateCityBorn(LocationModel location);

  Future<Either<Failure, void>> updateLanguages(List<DictModel> value);

  Future<Either<Failure, void>> updateDistance(int value);

  @Deprecated('Use method from PhotosRepository')
  Future<Either<Failure, PhotoModel>> uploadPhoto(List<int> image);

  @Deprecated('Use method from PhotosRepository')
  Future<Either<Failure, void>> sortPhotos(SortPhotosRequestDTO data);

  @Deprecated('Use method from PhotosRepository')
  Future<Either<Failure, List<PhotoModel>>> getPhotos();

  @Deprecated('Use method from PhotosRepository')
  Future<Either<Failure, void>> deletePhoto(int id);

  Future<Either<Failure, void>> updateFirstName(String value);

  Future<Either<Failure, void>> updateEducation(DictModel value);

  Future<Either<Failure, void>> updateProfessionalStatus(DictModel value);

  Future<Either<Failure, void>> updateReligion(DictModel value);

  Future<Either<Failure, void>> updateSphere(DictModel value);

  Future<Either<Failure, void>> updateFamilyPlan(DictModel value);

  Future<Either<Failure, void>> updateCovid(DictModel value);

  Future<Either<Failure, void>> updateSmokeStatus(DictModel value);

  Future<Either<Failure, void>> updateAlcoholStatus(DictModel value);

  Future<Either<Failure, void>> updateFoodPreference(DictModel value);

  Future<Either<Failure, void>> updateWorkout(DictModel value);

  Future<Either<Failure, void>> updateSleepHabit(DictModel value);

  Future<Either<Failure, void>> updatePets(List<DictModel> value);

  Future<Either<Failure, void>> updateIdealMeetingPoints(List<DictModel> value);

  Future<Either<Failure, void>> updateAboutMe(String value);

  Future<Either<Failure, void>> updateInterests(List<DictModel> value);

  Future<Either<Failure, void>> updateFCMToken(String token);
}
