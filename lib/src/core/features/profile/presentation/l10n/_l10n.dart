// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class ProfileI18n {
  static String get editProfileBtn => Intl.message(
        'Ред. профиль',
        desc: 'Название кнопки редактирования',
        name: 'ProfileI18n_editProfileBtn',
      );

  static String get firstName => Intl.message(
        'Имя',
        desc: 'firstName',
        name: 'ProfileI18n_firstName',
      );

  static String get birthday => Intl.message(
        'Дата рождения',
        desc: 'birthday',
        name: 'ProfileI18n_birthday',
      );

  static String get birthdayTitle => Intl.message(
        'Выберите вашу дату рождения',
        desc: 'birthday',
        name: 'ProfileI18n_birthdayTitle',
      );

  static String get birthTime => Intl.message(
        'Время рождения',
        desc: 'birthTime',
        name: 'ProfileI18n_birthTime',
      );

  static String get birthTimeDescription => Intl.message(
        'Выберите ваше время рождения',
        desc: 'birthTimeDescription',
        name: 'ProfileI18n_birthTimeDescription',
      );

  static String get editDescription => Intl.message(
        'Для изменения имени, даты или места рождения обратись в службу поддержки',
        desc: 'editDescription',
        name: 'ProfileI18n_editDescription',
      );

  static String get editProfileBirthday => Intl.message(
        'Изменить дату рождения',
        desc: 'Изменить дату рождения',
        name: 'ProfileI18n_editProfileBirthday',
      );

  static String get birthdayDescription => Intl.message(
        'Другие пользователи увидят\nтолько ваш возраст',
        desc: 'birthdayDescription',
        name: 'ProfileI18n_birthdayDescription',
      );

  static String get birthdayLocation => Intl.message(
        'Место рождения',
        desc: 'birthdayLocation',
        name: 'ProfileI18n_birthdayLocation',
      );

  static String get editProfileBirthTime => Intl.message(
        'Изменить время рождения',
        desc: 'Изменить время рождения',
        name: 'ProfileI18n_editProfileBirthTime',
      );

  static String get editProfile => Intl.message(
        'Редактировать',
        desc: 'Редактировать',
        name: 'ProfileI18n_editProfile',
      );

  static String get myProfile => Intl.message(
        'Моя анкета',
        name: 'ProfileI18n_myProfile',
      );

  static String questionnaireTitle(QuestionnaireEnum value) => Intl.select(
        value,
        {
          QuestionnaireEnum.height: 'Рост',
          QuestionnaireEnum.education: 'Образование',
          QuestionnaireEnum.professionalStatus: 'Проф. статус',
          QuestionnaireEnum.sphere: 'Сфера деятельности',
          QuestionnaireEnum.religion: 'Вероисповедание',
          QuestionnaireEnum.familyPlan: 'Планы на семью',
          QuestionnaireEnum.smokeStatus: 'Курение',
          QuestionnaireEnum.alcoholStatus: 'Алкоголь',
          QuestionnaireEnum.foodPreference: 'Предпочтение в еде',
          QuestionnaireEnum.workout: 'Тренировки',
          QuestionnaireEnum.sleepHabit: 'Предпочтения во сне',
          QuestionnaireEnum.covid: 'Вакцина от COVID',
          QuestionnaireEnum.pets: 'Питомцы',
          QuestionnaireEnum.idealMeetingPoints: 'Идеальное свидание',
        },
        name: 'ProfileI18n_questionnaireTitle',
        args: [value],
      );

  static String heightValue(num value) => Intl.message(
        '$value см',
        name: 'ProfileI18n_heightValue',
        args: [value],
      );

  static String get addAnswer => Intl.message(
        'Добавить ответ',
        name: 'ProfileI18n_addAnswer',
      );

  static String get myInterests => Intl.message(
        'Мои интересы',
        name: 'ProfileI18n_myInterests',
      );

  static String get languageSkills => Intl.message(
        'Владение языками',
        name: 'ProfileI18n_languageSkills',
      );

  static String get multiSelectTitle => Intl.message(
        'Отметьте один или несколько вариантов',
        name: 'ProfileI18n_multiSelectTitle',
      );

  static String get noPets => Intl.message(
        'Нет питомцев',
        name: 'ProfileI18n_noPets',
      );

  // static String zodiac(ZodiacEnum value) => Intl.select(
  //       value,
  //       {
  //         ZodiacEnum.aquarius: 'Водолей',
  //         ZodiacEnum.pisces: 'Рыбы',
  //         ZodiacEnum.aries: 'Овен',
  //         ZodiacEnum.calf: 'Телец',
  //         ZodiacEnum.gemini: 'Близнецы',
  //         ZodiacEnum.cancer: 'Рак',
  //         ZodiacEnum.leo: 'Лев',
  //         ZodiacEnum.virgo: 'Дева',
  //         ZodiacEnum.libra: 'Весы',
  //         ZodiacEnum.scorpion: 'Скорпион',
  //         ZodiacEnum.sagittarius: 'Стрелец',
  //         ZodiacEnum.capricorn: 'Козерог',
  //       },
  //       desc: 'Зодиак',
  //       name: 'ProfileI18n_zodiac',
  //       args: [value],
  //     );

  static String get emptyPhoto => Intl.message(
        'Фотографии не загружены',
        desc: 'Подсказка, когда фотографии не загружены',
        name: 'ProfileI18n_emptyPhoto',
      );

  static String get photos => Intl.message(
        'Фотографии',
        desc: 'Фотографии',
        name: 'ProfileI18n_photos',
      );

  static String bornCardTitle(
    String city,
    String birthday,
    String time,
  ) =>
      Intl.message(
        '$city, $birthday $time',
        desc: 'Заголовок карточки пользовательских данных',
        name: 'ProfileI18n_bornCardTitle',
        args: [city, birthday, time],
      );

  static String get ratingCardTitle => Intl.message(
        'Ваш рейтинг',
        desc: 'Заголовок карточки рейтинга пользователя',
        name: 'ProfileI18n_ratingCardTitle',
      );

  static String get ratingCardDescription => Intl.message(
        'Что влияет на рейтинг?',
        desc: 'Описание карточки рейтинга пользователя',
        name: 'ProfileI18n_ratingCardDescription',
      );

  static String get questionnaireCardTitle => Intl.message(
        'Профиль заполнен:',
        desc: 'Заголовок карточки процент заполненности анкеты',
        name: 'ProfileI18n_questionnaireCardTitle',
      );

  static String get questionnaireCardDescription => Intl.message(
        'Заполни на 100% и получи\nодно свидание в подарок',
        desc: 'Описание карточки процент заполненности анкеты',
        name: 'ProfileI18n_questionnaireCardDescription',
      );

  static String get aboutMeCardTitle => Intl.message(
        'Главное обо мне',
        desc: 'Заголовок карточки информации о пользователи',
        name: 'ProfileI18n_aboutMeCardTitle',
      );

  static String get aboutMeCardDescription => Intl.message(
        'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Lorem ipsum dolor sit\namet, consectetur adipiscing elit...',
        desc: 'Описание карточки информации о пользователи',
        name: 'ProfileI18n_aboutMeCardDescription',
      );

  static String get activateHintsCardTitle => Intl.message(
        'Активируй подсказки',
        desc: 'Заголовок карточки активировать подсказки telegram bot',
        name: 'ProfileI18n_activateHintsCardTitle',
      );

  static String get activateHintsCardDescription => Intl.message(
        'Помогает увеличить количество и качество знакомств',
        desc: 'Описание карточки активировать подсказки telegram bot',
        name: 'ProfileI18n_activateHintsCardDescription',
      );

  static String get questionnaire => Intl.message(
        'Анкета',
        desc: 'Анкета',
        name: 'ProfileI18n_questionnaire',
      );

  static String get interests => Intl.message(
        'Мои интересы',
        desc: 'Интересы',
        name: 'ProfileI18n_interests',
      );

  static String get interestsHint => Intl.message(
        'Расскажи о своих интересах.\nЭто улучшит работу алгоритма.',
        desc: 'Расскажи о своих интересах',
        name: 'ProfileI18n_interestsHint',
      );

  static String get selectInterests => Intl.message(
        'Отметьте от 1 до 9 вариантов',
        desc: 'Интересы',
        name: 'ProfileI18n_selectInterests',
      );

  static String get newPhotoDescription => Intl.message(
        'Добавление новых фото приведет\nк повторной модерации',
        desc: 'Добавление новых фото приведет к повторной модерации',
        name: 'ProfileI18n_newPhotoDescription',
      );

  static String get successSaveData => Intl.message(
        'Данные успешно сохранены',
        desc: 'successSaveData',
        name: 'ProfileI18n_successSaveData',
      );

  static String get bioHint => Intl.message(
        'Напиши о себе несколько строк. Это кратно повысит интерес к тебе.',
        desc: 'bioHint',
        name: 'ProfileI18n_bioHint',
      );

  static String get addPhotoHint => Intl.message(
        'Добавить\nфото',
        desc: 'Добавить фото подсказка',
        name: 'ProfileI18n_addPhotoHint',
      );
}
