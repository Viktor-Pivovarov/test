import 'package:intl/intl.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class CoreI18n {
  static String get forbiddenError => Intl.message(
        'Forbidden',
        desc: 'Http Error forbidden',
        name: 'CoreI18n_forbiddenError',
      );
  static String get internalError => Intl.message(
        'Internal Error',
        desc: 'Server Internal Error',
        name: 'CoreI18n_internalError',
      );
  static String get serviceUnavailableError => Intl.message(
        'Service Unavaliable',
        desc: 'Service Unavaliable Error',
        name: 'CoreI18n_serviceUnavailableError',
      );
  static String get notFoundError => Intl.message(
        'Not found',
        desc: 'Not found Error',
        name: 'CoreI18n_notFoundError',
      );
  static String get unknownError => Intl.message(
        'Unknown Error',
        desc: 'Unknown Error',
        name: 'CoreI18n_unknownError',
      );

  static String get iConfirm => Intl.message(
        'Подтверждаю',
        desc: 'iConfirm',
        name: 'CoreI18n_iConfirm',
      );

  static String get confirm => Intl.message(
        'Подтвердить',
        desc: 'confirm',
        name: 'CoreI18n_confirm',
      );

  static String get yes => Intl.message(
        'Да',
        desc: 'yes',
        name: 'CoreI18n_yes',
      );

  static String get no => Intl.message(
        'Нет',
        desc: 'no',
        name: 'CoreI18n_no',
      );

  static String get signOut => Intl.message(
        'Хотите выйти?',
        desc: 'confirm',
        name: 'CoreI18n_signOut',
      );

  static String get next => Intl.message(
        'Далее',
        desc: 'next',
        name: 'CoreI18n_next',
      );

  static String get save => Intl.message(
        'Сохранить',
        desc: 'save',
        name: 'CoreI18n_save',
      );

  static String get skip => Intl.message(
        'Пропустить',
        desc: 'skip',
        name: 'CoreI18n_skip',
      );

  static String get aquarius => Intl.message(
        'Водолей',
        desc: 'aquarius',
        name: 'CoreI18n_aquarius',
      );

  static String get pisces => Intl.message(
        'Рыбы',
        desc: 'pisces',
        name: 'CoreI18n_pisces',
      );

  static String get aries => Intl.message(
        'Овен',
        desc: 'aries',
        name: 'CoreI18n_aries',
      );

  static String get taurus => Intl.message(
        'Телец',
        desc: 'taurus',
        name: 'CoreI18n_taurus',
      );

  static String get gemini => Intl.message(
        'Близнецы',
        desc: 'gemini',
        name: 'CoreI18n_gemini',
      );

  static String get cancer => Intl.message(
        'Рак',
        desc: 'cancer',
        name: 'CoreI18n_cancer',
      );

  static String get leo => Intl.message(
        'Лев',
        desc: 'leo',
        name: 'CoreI18n_leo',
      );

  static String get virgo => Intl.message(
        'Дева',
        desc: 'virgo',
        name: 'CoreI18n_virgo',
      );

  static String get libra => Intl.message(
        'Весы',
        desc: 'libra',
        name: 'CoreI18n_libra',
      );

  static String get scorpio => Intl.message(
        'Скорпион',
        desc: 'scorpio',
        name: 'CoreI18n_scorpio',
      );

  static String get sagittarius => Intl.message(
        'Стрелец',
        desc: 'sagittarius',
        name: 'CoreI18n_sagittarius',
      );

  static String get capricorn => Intl.message(
        'Козерог',
        desc: 'capricorn',
        name: 'CoreI18n_capricorn',
      );

  static String age([int value = 0]) => Intl.plural(
        value,
        zero: '$value лет',
        one: '$value год',
        two: '$value года',
        few: '$value года',
        many: '$value лет',
        other: '$value года',
        desc: 'year',
        args: [value],
        name: 'CoreI18n_age',
      );

  static String zodiac(Object choice) => Intl.select(
        choice,
        <Object, String>{
          ZodiacEnum.aquarius: aquarius,
          ZodiacEnum.pisces: pisces,
          ZodiacEnum.aries: aries,
          ZodiacEnum.taurus: taurus,
          ZodiacEnum.gemini: gemini,
          ZodiacEnum.cancer: cancer,
          ZodiacEnum.leo: leo,
          ZodiacEnum.virgo: virgo,
          ZodiacEnum.libra: libra,
          ZodiacEnum.scorpio: scorpio,
          ZodiacEnum.sagittarius: sagittarius,
          ZodiacEnum.capricorn: capricorn,
        },
        desc: 'Зодиак',
        name: 'CoreI18n_empty_photo',
      );

  static String get block => Intl.message(
        'Заблокировать',
        desc: 'Заблокировать',
        name: 'CoreI18n_block',
      );

  static String get addToBlackList => Intl.message(
        'Добавить в черный список?',
        desc: 'Добавить в черный список?',
        name: 'CoreI18n_addToBlackList',
      );

  static String get complain => Intl.message(
        'Пожаловаться',
        desc: 'Пожаловаться',
        name: 'CoreI18n_complain',
      );

  static String get complainAndBlock => Intl.message(
        'Пожаловаться и заблокировать',
        desc: 'Пожаловаться и заблокировать',
        name: 'CoreI18n_complainAndBlock',
      );

  static String get candidateBreakingRules => Intl.message(
        'Кандидат нарушает правила?',
        desc: 'Кандидат нарушает правила?',
        name: 'CoreI18n_candidateBreakingRules',
      );

  static String get complainReasons => Intl.message(
        'Укажи пожалуйста причину жалобы',
        desc: 'Укажи пожалуйста причину жалобы',
        name: 'CoreI18n_complainReasons',
      );

  static String willNotKnow(String value) => Intl.message(
        '$value не узнает о жалобе',
        desc: ' не узнает о жалобе',
        name: 'CoreI18n_willNotKnow',
        args: [value],
      );
}
