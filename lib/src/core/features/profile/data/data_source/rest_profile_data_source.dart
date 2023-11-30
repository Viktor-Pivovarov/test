import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'rest_profile_data_source.g.dart';

@RestApi()
abstract class RestProfileDataSource implements ProfileDataSource {
  factory RestProfileDataSource(Dio dio, {String baseUrl}) =
      _RestProfileDataSource;

  @override
  @GET(ProfileApiMethods.worksheetExamination)
  Future<Examination> getExam();

  @override
  @GET(ProfileApiMethods.personalUserInfo)
  Future<AuthenticatedUser> getUserInfo();

  @override
  @POST(ProfileApiMethods.personalCabinetAlcohol)
  Future<void> updateAlcoholStatus(@Field('alcoholStatusId') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetCovid)
  Future<void> updateCovid(@Field('covidId') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetEducation)
  Future<void> updateEducation(@Field('educationId') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetFamilyPlan)
  Future<void> updateFamilyPlan(@Field('familyPlanId') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetFoodPreference)
  Future<void> updateFoodPreference(@Field('foodPreferenceId') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetHeight)
  Future<void> updateHeight(@Field('height') int height);

  @override
  @POST(ProfileApiMethods.personalCabinetIdealMeetingPoint)
  Future<void> updateIdealMeetingPoints(
    @Field('idealMeetingPoints') List<int> ids,
  );

  @override
  @POST(ProfileApiMethods.personalCabinetLanguages)
  Future<void> updateLanguages(@Field('languages') List<int> ids);

  @override
  @POST(ProfileApiMethods.personalCabinetDistance)
  Future<void> updateDistance(@Field('distance') int value);

  @override
  @POST(ProfileApiMethods.personalCabinetPets)
  Future<void> updatePets(@Field('pets') List<int> ids);

  @override
  @POST(ProfileApiMethods.personalCabinetProfessionalStatus)
  Future<void> updateProfessionalStatus(@Field('professionalStatusId') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetReligion)
  Future<void> updateReligion(@Field('religionId') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetSleepHabit)
  Future<void> updateSleepHabit(@Field('sleepHabitId') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetSmoke)
  Future<void> updateSmokeStatus(@Field('smokeStatusId') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetSphere)
  Future<void> updateSphere(@Field('sphereId') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetWorkout)
  Future<void> updateWorkout(@Field('workoutId') int id);

  @override
  @POST(ProfileApiMethods.locationCoordinate)
  Future<void> setLocationCoordinate(LocationDTO data);

  @override
  @POST(ProfileApiMethods.notificationAllowed)
  Future<void> setNotificationAllowed(bool allowNotifications);

  @override
  @POST(ProfileApiMethods.personalCabinetInterests)
  Future<void> updateInterests(@Field() List<int> interests);

  @override
  @POST(ProfileApiMethods.personalCabinetPhotos)
  @MultiPart()
  Future<PhotoModel> uploadPhoto(
    @Part(name: 'image', fileName: 'image.jpg') List<int> image,
  );

  @override
  @DELETE(ProfileApiMethods.personalCabinetDeletePhotos)
  Future<void> deletePhoto(@Path('id') int id);

  @override
  @POST(ProfileApiMethods.personalCabinetSortPhotos)
  Future<void> sortPhotos(@Body() SortPhotosRequestDTO data);

  @override
  @GET(ProfileApiMethods.personalPhotos)
  Future<PhotosResponseDTO> getPhotos();

  @override
  @POST(ProfileApiMethods.personalCabinetFirstName)
  Future<void> updateFirstName(@Field('firstName') String value);

  @override
  @POST(ProfileApiMethods.personalCabinetBirthday)
  Future<void> updateBirthday(@Field() String birthday);

  @override
  @POST(ProfileApiMethods.personalCabinetBirthTime)
  Future<void> updateBirthTime(@Field() String birthtime);

  @override
  @POST(ProfileApiMethods.personalCabinetCityBorn)
  Future<void> updateCityBorn(@Body() LocationModel location);

  @override
  @POST(ProfileApiMethods.personalBio)
  Future<void> updateAboutMe(@Field() String bio);

  @override
  @POST(ProfileApiMethods.fcmTokenRefresh)
  Future<void> updateFCMToken(@Field('fcmToken') String token);
}
