import 'package:jojo/src/core/_core.dart';

class MockDictDataSource implements DictDataSource {
  @override
  Future<ResponseDictModel> getAlcoholStatuses() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getEducations() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getFamilyPlans() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getFoodPreferences() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getIdealMeetingPoints() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getLanguages() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getPets() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getProfessionalStatuses() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getReligions() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getSleepHabits() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getSmokeStatuses() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getSpheres() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getWorkouts() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getCovid() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseDictModel> getComplainReasons() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseDictModel();
      },
    );
  }

  @override
  Future<ResponseInterestModel> getInterests() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const ResponseInterestModel();
      },
    );
  }
}
