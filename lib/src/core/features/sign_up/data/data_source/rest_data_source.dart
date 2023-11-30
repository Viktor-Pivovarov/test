import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'rest_data_source.g.dart';

@RestApi()
abstract class RestSignUpDataSource {
  factory RestSignUpDataSource(Dio dio, {String baseUrl}) =
      _RestSignUpDataSource;

  @GET(CommonApiMethods.citiesAutocomplete)
  Future<List<CityModel>> getCities(@Query('q') String q);

  @GET(ProfileApiMethods.worksheetSteps)
  Future<WorksheetStepsResponseModel> getWorksheetSteps();

  @POST(ProfileApiMethods.worksheetFirstName)
  Future<void> setFirstName(@Field() String firstName);

  @POST(ProfileApiMethods.worksheetBirthday)
  Future<void> setBirthday(@Field() String birthday);

  @POST(ProfileApiMethods.worksheetHeight)
  Future<void> setHeight(@Field() int height);

  @POST(ProfileApiMethods.worksheetBirthTime)
  Future<void> setBirthTime(@Field('birthtime') String birthTime);

  @POST(ProfileApiMethods.worksheetCityBorn)
  Future<void> setCityBorn(@Body() LocationModel location);

  @POST(ProfileApiMethods.worksheetLanguages)
  Future<void> setLanguages(@Field() List<int> languages);

  @POST(ProfileApiMethods.worksheetPhotos)
  @MultiPart()
  Future<PhotoModel> setPhoto(
    @Part(name: 'image', fileName: 'image.jpg') List<int> image,
  );

  @DELETE(ProfileApiMethods.worksheetDeletePhotos)
  Future<void> deletePhoto(@Path('id') int id);

  @POST(ProfileApiMethods.worksheetPhotosIncrement)
  Future<void> setPhotosIncrement();

  @POST(ProfileApiMethods.worksheetSearchAge)
  Future<void> setSearchAge(
    @Field() int ageFrom,
    @Field() int ageTo,
  );

  @POST(ProfileApiMethods.worksheetSearchHeight)
  Future<void> setSearchHeight(
    @Field() int heightFrom,
    @Field() int heightTo,
  );

  @GET(ProfileApiMethods.worksheetExamination)
  Future<Examination> getExam();

  @POST(ProfileApiMethods.worksheetBiometrics)
  @MultiPart()
  Future<PhotoModel> setBiometrics(
    @Part(name: 'image', fileName: 'image.jpg') List<int> image,
  );

  @POST(ProfileApiMethods.worksheetBiometricsIncrement)
  Future<void> setBiometricsIncrement();

  @POST(ProfileApiMethods.worksheetWelcome)
  Future<void> welcome();

  @POST(ProfileApiMethods.worksheetComplete)
  Future<void> complete();

  @POST(ProfileApiMethods.worksheetSortPhotos)
  Future<void> sortPhotos(@Body() SortPhotosRequestDTO data);

  @GET(ProfileApiMethods.personalPhotos)
  Future<PhotosResponseDTO> getPhotos();
}
