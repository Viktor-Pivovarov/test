import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class MockProfileDataSource implements ProfileDataSource {
  @override
  Future<void> updateAlcoholStatus(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateCovid(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateEducation(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateFamilyPlan(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateFoodPreference(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateHeight(int height) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateLanguages(List<int> ids) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updatePets(List<int> ids) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateProfessionalStatus(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateReligion(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateSleepHabit(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateSmokeStatus(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateSphere(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updateWorkout(int id) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<Examination> getExam() {
    throw UnimplementedError();
  }

  @override
  Future<AuthenticatedUser> getUserInfo() {
    throw UnimplementedError();
  }

  @override
  Future<void> setLocationCoordinate(LocationDTO data) {
    throw UnimplementedError();
  }

  @override
  Future<void> setNotificationAllowed(bool allowNotifications) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateInterests(List<int> interests) {
    throw UnimplementedError();
  }

  @override
  Future<PhotoModel> uploadPhoto(List<int> image) {
    throw UnimplementedError();
  }

  @override
  Future<void> deletePhoto(int id) {
    // TODO: implement deletePhoto
    throw UnimplementedError();
  }

  @override
  Future<void> updateFirstName(String value) {
    // TODO: implement updateFirstName
    throw UnimplementedError();
  }

  @override
  Future<void> updateBirthday(String value) {
    // TODO: implement updateBirthday
    throw UnimplementedError();
  }

  @override
  Future<void> updateBirthTime(String value) {
    // TODO: implement updateBirthTime
    throw UnimplementedError();
  }

  @override
  Future<void> updateCityBorn(LocationModel location) {
    // TODO: implement updateCityBorn
    throw UnimplementedError();
  }

  @override
  Future<void> updateIdealMeetingPoints(List<int> ids) {
    // TODO: implement updateIdealMeetingPoints
    throw UnimplementedError();
  }

  @override
  Future<void> updateAboutMe(String value) {
    // TODO: implement updateAboutMe
    throw UnimplementedError();
  }

  @override
  Future<void> sortPhotos(SortPhotosRequestDTO data) {
    // TODO: implement sortPhotos
    throw UnimplementedError();
  }

  @override
  Future<PhotosResponseDTO> getPhotos() {
    // TODO: implement getPhotos
    throw UnimplementedError();
  }

  @override
  Future<void> updateDistance(int value) {
    // TODO: implement updateDistance
    throw UnimplementedError();
  }

  @override
  Future<void> updateFCMToken(String value) {
    // TODO: implement updateFCMToken
    throw UnimplementedError();
  }
}
