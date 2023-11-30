import 'package:jojo/src/core/_core.dart';

/// Списки классификаторов.
abstract class DictDataSource {
  Future<ResponseDictModel> getAlcoholStatuses();
  Future<ResponseDictModel> getEducations();
  Future<ResponseDictModel> getFamilyPlans();
  Future<ResponseDictModel> getFoodPreferences();
  Future<ResponseDictModel> getIdealMeetingPoints();
  Future<ResponseDictModel> getLanguages();
  Future<ResponseDictModel> getPets();
  Future<ResponseDictModel> getProfessionalStatuses();
  Future<ResponseDictModel> getReligions();
  Future<ResponseDictModel> getSleepHabits();
  Future<ResponseDictModel> getSmokeStatuses();
  Future<ResponseDictModel> getSpheres();
  Future<ResponseDictModel> getWorkouts();
  Future<ResponseDictModel> getCovid();
  Future<ResponseDictModel> getComplainReasons();

  Future<ResponseInterestModel> getInterests();
}
