import 'package:dio/dio.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_dict_data_source.g.dart';

@RestApi()
abstract class RestDictDataSource implements DictDataSource {
  factory RestDictDataSource(Dio dio, {String baseUrl}) = _RestDictDataSource;

  @override
  @GET(CommonApiMethods.dictAlcoholStatuses)
  Future<ResponseDictModel> getAlcoholStatuses();

  @override
  @GET(CommonApiMethods.dictEducations)
  Future<ResponseDictModel> getEducations();

  @override
  @GET(CommonApiMethods.dictFamilyPlans)
  Future<ResponseDictModel> getFamilyPlans();

  @override
  @GET(CommonApiMethods.dictFoodPreferences)
  Future<ResponseDictModel> getFoodPreferences();

  @override
  @GET(CommonApiMethods.dictIdealMeetingPoints)
  Future<ResponseDictModel> getIdealMeetingPoints();

  @override
  @GET(CommonApiMethods.dictLanguages)
  Future<ResponseDictModel> getLanguages();

  @override
  @GET(CommonApiMethods.dictPets)
  Future<ResponseDictModel> getPets();

  @override
  @GET(CommonApiMethods.dictProfessionalStatuses)
  Future<ResponseDictModel> getProfessionalStatuses();

  @override
  @GET(CommonApiMethods.dictReligions)
  Future<ResponseDictModel> getReligions();

  @override
  @GET(CommonApiMethods.dictSleepHabits)
  Future<ResponseDictModel> getSleepHabits();

  @override
  @GET(CommonApiMethods.dictSmokeStatuses)
  Future<ResponseDictModel> getSmokeStatuses();

  @override
  @GET(CommonApiMethods.dictSpheres)
  Future<ResponseDictModel> getSpheres();

  @override
  @GET(CommonApiMethods.dictWorkouts)
  Future<ResponseDictModel> getWorkouts();

  @override
  @GET(CommonApiMethods.dictCovid)
  Future<ResponseDictModel> getCovid();

  @override
  @GET(CommonApiMethods.dictInterests)
  Future<ResponseInterestModel> getInterests();

  @override
  @GET(CommonApiMethods.dictComplainReasons)
  Future<ResponseDictModel> getComplainReasons();
}
