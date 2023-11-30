import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class MockSignUpDataSource implements RestSignUpDataSource {
  @override
  Future<WorksheetStepsResponseModel> getWorksheetSteps() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    return const WorksheetStepsResponseModel(
      currentStep: StepEnum.firstName,
      steps: [
        StepModel(
          position: 1,
          step: StepEnum.firstName,
          name: 'firstName',
          delay: 10,
        ),
        StepModel(
          position: 2,
          step: StepEnum.birthday,
          name: 'birthday',
          delay: 10,
        ),
        StepModel(
          position: 3,
          step: StepEnum.height,
          name: 'height',
          delay: 10,
        ),
        StepModel(
          position: 4,
          step: StepEnum.cityBorn,
          name: 'cityBorn',
          delay: 10,
        ),
        // StepModel(
        //   position: 5,
        //   step: StepEnum.birthTime,
        //   name: 'complete',
        //   delay: 10,
        // ),
      ],
    );
  }

  @override
  Future<List<CityModel>> getCities(String q) async {
    return <CityModel>[];
  }

  @override
  Future<PhotoModel> setBiometrics(List<int> image) async {
    throw Exception();
  }

  @override
  Future<void> setBiometricsIncrement() async {}

  @override
  Future<void> setBirthday(String birthday) async {}

  @override
  Future<void> setBirthTime(String birthTime) async {}

  @override
  Future<void> setCityBorn(LocationModel location) async {}

  Future<void> setComplete() async {}

  @override
  Future<void> setFirstName(String firstName) async {}

  @override
  Future<void> setHeight(int height) async {}

  @override
  Future<void> setLanguages(List<int> languages) async {}

  @override
  Future<PhotoModel> setPhoto(List<int> image) async {
    throw Exception();
  }

  @override
  Future<void> setPhotosIncrement() async {}

  @override
  Future<void> setSearchAge(int ageFrom, int ageTo) async {}

  @override
  Future<void> setSearchHeight(int heightFrom, int heightTo) async {}

  @override
  Future<void> complete() {
    throw UnimplementedError();
  }

  @override
  Future<Examination> getExam() {
    // TOD(vpavlov)O: implement getExam
    throw UnimplementedError();
  }

  @override
  Future<void> welcome() {
    throw UnimplementedError();
  }

  @override
  Future<void> deletePhoto(int id) {
    // TODO: implement deletePhoto
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
}
