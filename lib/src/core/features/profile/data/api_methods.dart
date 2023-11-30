class ProfileApiMethods {
  /// Получение шагов регистрации
  static const String worksheetSteps = '/v1/personal/worksheet-steps';

  /// Получение задания для регистрации
  static const String worksheetExamination = '/v1/personal/examination';

  /// Заполнение имени
  static const String worksheetFirstName = '/v1/personal/worksheet/first-name';

  /// Заполнение дня рождения
  static const String worksheetBirthday = '/v1/personal/worksheet/birthday';

  /// Заполнение роста
  static const String worksheetHeight = '/v1/personal/worksheet/height';

  /// Заполнение времени рождения
  static const String worksheetBirthTime = '/v1/personal/worksheet/birthtime';

  /// Заполнение города рождения
  static const String worksheetCityBorn = '/v1/personal/worksheet/city-born';

  /// Шаг приветствия
  static const String worksheetWelcome = '/v1/personal/worksheet/welcome';

  /// Завершение регистрации
  static const String worksheetComplete = '/v1/personal/worksheet/complete';

  /// Заполнение координат места нахождения
  static const String locationCoordinate = '/v1/personal/location-coordinate';

  /// Разрешение на нотификации
  static const String notificationAllowed = '/v1/personal/notification-allowed';

  /// Заполнение языков
  static const String worksheetLanguages = '/v1/personal/worksheet/languages';

  /// Заполнение фоток
  static const String worksheetPhotos = '/v1/personal/worksheet/photos';

  static const String searchPreferences = '/v1/personal/search-preferences';

  /// Сортировка фото
  static const String worksheetSortPhotos =
      '/v1/personal/worksheet/photos-sorting';

  static const String worksheetDeletePhotos =
      '/v1/personal/worksheet/photos/{id}';

  /// Переход на следующий шаг после фото
  static const String worksheetPhotosIncrement =
      '/v1/personal/worksheet/photos-increment';

  /// Заполнение поиска возраста
  static const String worksheetSearchAge = '/v1/personal/worksheet/search-age';

  /// Заполнение поиска роста
  static const String worksheetSearchHeight =
      '/v1/personal/worksheet/search-height';

  /// Заполнение фото подтверждения личности
  static const String worksheetBiometrics = '/v1/personal/worksheet/biometrics';

  /// Переход на следующий шаг после подтверждения личности
  static const String worksheetBiometricsIncrement =
      '/v1/personal/worksheet/biometrics-increment';

  // Profile cabinet
  static const personalUserInfo = '/v1/personal/userinfo';
  static const personalCabinetHeight = '/v1/personal/cabinet/height';
  static const personalCabinetEducation = '/v1/personal/cabinet/education';
  static const personalCabinetProfessionalStatus =
      '/v1/personal/cabinet/professional-status';
  static const personalCabinetSphere = '/v1/personal/cabinet/sphere';
  static const personalCabinetDistance = '/v1/personal/cabinet/distance';
  static const personalCabinetLanguages = '/v1/personal/cabinet/languages';
  static const personalCabinetReligion = '/v1/personal/cabinet/religion';
  static const personalCabinetPhotos = '/v1/personal/cabinet/photos';
  static const personalPhotos = '/v1/personal/user-photos';
  static const personalCabinetSortPhotos =
      '/v1/personal/cabinet/photos-sorting';
  static const personalCabinetDeletePhotos = '/v1/personal/cabinet/photos/{id}';

  static const personalCabinetFirstName = '/v1/personal/cabinet/first-name';
  static const personalCabinetFamilyPlan = '/v1/personal/cabinet/family-plan';
  static const personalCabinetSmoke = '/v1/personal/cabinet/smoke-status';
  static const personalCabinetAlcohol = '/v1/personal/cabinet/alcohol-status';
  static const personalCabinetFoodPreference =
      '/v1/personal/cabinet/food-preference';
  static const personalCabinetWorkout = '/v1/personal/cabinet/workout';
  static const personalCabinetSleepHabit = '/v1/personal/cabinet/sleep-habit';
  static const personalCabinetPets = '/v1/personal/cabinet/pets';
  static const personalCabinetIdealMeetingPoint =
      '/v1/personal/cabinet/ideal-meeting-points';
  static const personalCabinetCovid = '/v1/personal/cabinet/covid';
  static const personalCabinetInterests = '/v1/personal/cabinet/interests';

  static const personalCabinetBirthday = '/v1/personal/cabinet/birthday';
  static const personalCabinetBirthTime = '/v1/personal/cabinet/birthtime';
  static const personalCabinetCityBorn = '/v1/personal/cabinet/city-born';

  static const personalBio = '/v1/personal/cabinet/bio';

  static const fcmTokenRefresh = '/v1/fcm-token-refresh';
}
