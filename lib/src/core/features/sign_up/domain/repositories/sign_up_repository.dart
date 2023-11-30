import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

abstract class SignUpRepository {
  SignUpRepository(this._dataSource);

  // ignore: unused_field
  final RestSignUpDataSource _dataSource;

  Future<Either<Failure, WorksheetStepsResponseModel>> getWorksheetSteps();

  Future<Either<Failure, List<CityModel>>> getCities(String q);

  Future<Either<Failure, PhotoModel>> setBiometrics(List<int> image);

  Future<Either<Failure, void>> setBiometricsIncrement();

  Future<Either<Failure, void>> setBirthday(String birthday);

  Future<Either<Failure, void>> setBirthTime(String birthTime);

  Future<Either<Failure, void>> setCityBorn(LocationModel location);

  Future<Either<Failure, void>> setComplete();

  Future<Either<Failure, void>> setFirstName(String firstName);

  Future<Either<Failure, void>> setHeight(int height);

  Future<Either<Failure, void>> setLanguages(List<int> languages);

  Future<Either<Failure, PhotoModel>> setPhoto(List<int> image);

  Future<Either<Failure, void>> deletePhoto(int id);

  Future<Either<Failure, void>> setPhotosIncrement();

  Future<Either<Failure, void>> setSearchAge(int ageFrom, int ageTo);

  Future<Either<Failure, void>> setSearchHeight(
    int heightFrom,
    int heightTo,
  );

  Future<Either<Failure, void>> setLocationCoordinate(LocationDTO data);

  Future<Either<Failure, void>> welcome();

  Future<Either<Failure, void>> sortPhotos(SortPhotosRequestDTO data);

  Future<Either<Failure, List<PhotoModel>>> getPhotos();
}
