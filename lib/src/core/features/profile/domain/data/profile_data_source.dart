import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

abstract class ProfileDataSource {
  // POST /v1/personal/cabinet/height {height:integer}
  Future<void> updateHeight(int height);

  // POST /v1/personal/cabinet/education {educationId:integer}
  Future<void> updateEducation(int id);

  // POST /v1/personal/cabinet/professional-status {professionalStatusId:integer}
  Future<void> updateProfessionalStatus(int id);

  // POST /v1/personal/cabinet/sphere {sphereId:integer}
  Future<void> updateSphere(int id);

  // POST /v1/personal/cabinet/languages {int[]}
  Future<void> updateLanguages(List<int> ids);

  Future<void> updateDistance(int value);

  // POST /v1/personal/cabinet/religion {religionId:integer}
  Future<void> updateReligion(int id);

  // POST /v1/personal/cabinet/family-plan {familyPlanId:integer}
  Future<void> updateFamilyPlan(int id);

  // POST /v1/personal/cabinet/smoke {smokeStatusId:integer}
  Future<void> updateSmokeStatus(int id);

  // POST /v1/personal/cabinet/alcohol {alcoholStatusId:integer}
  Future<void> updateAlcoholStatus(int id);

  // POST /v1/personal/cabinet/food-preference {foodPreferenceId}
  Future<void> updateFoodPreference(int id);

  // POST /v1/personal/cabinet/workout {workoutId:integer}
  Future<void> updateWorkout(int id);

  // POST /v1/personal/cabinet/sleep-habit {sleepHabitId:integer}
  Future<void> updateSleepHabit(int id);

  // POST /v1/personal/cabinet/pets {int[]}
  Future<void> updatePets(List<int> ids);

  // POST /v1/personal/cabinet/ideal-meeting-points {idealMeetingPointId:integer}
  Future<void> updateIdealMeetingPoints(List<int> ids);

  // POST /v1/personal/cabinet/covid {covidId:integer}
  Future<void> updateCovid(int id);

  // GET '/v1/personal/userinfo',
  Future<AuthenticatedUser> getUserInfo();

  // GET '/v1/personal/examination',
  Future<Examination> getExam();

  // POST '/v1/personal/location-coordinate',
  Future<void> setLocationCoordinate(LocationDTO data);

  // POST '/v1/personal/notification-allowed',
  Future<void> setNotificationAllowed(bool allowNotifications);

  // POST '/v1/personal/cabinet/interests',
  Future<void> updateInterests(List<int> interests);

  @Deprecated('Use method from PhotosRepository')
  Future<PhotoModel> uploadPhoto(List<int> image);

  @Deprecated('Use method from PhotosRepository')
  Future<void> sortPhotos(SortPhotosRequestDTO data);

  @Deprecated('Use method from PhotosRepository')
  Future<PhotosResponseDTO> getPhotos();

  @Deprecated('Use method from PhotosRepository')
  Future<void> deletePhoto(int id);

  Future<void> updateFirstName(String value);

  Future<void> updateBirthday(String value);

  Future<void> updateBirthTime(String value);

  Future<void> updateCityBorn(LocationModel location);

  Future<void> updateAboutMe(String value);

  Future<void> updateFCMToken(String value);
}
