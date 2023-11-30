// part of 'package:jojo/l10n/localizations.dart';

// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';

class CommonI18n {
  static String get male => Intl.message(
        'Мужской',
        desc: 'Пол человека',
        name: 'CommonI18n_male',
      );

  static String get female => Intl.message(
        'Женский',
        desc: 'Пол человека',
        name: 'CommonI18n_female',
      );

  static String get yes => Intl.message(
        'Да',
        desc: 'Подтверждение',
        name: 'CommonI18n_yes',
      );

  static String get no => Intl.message(
        'Нет',
        desc: 'Подтверждение',
        name: 'CommonI18n_no',
      );

  static String get inTheMorning => Intl.message(
        'Утром',
        desc: 'Время суток',
        name: 'CommonI18n_inTheMorning',
      );

  static String get inTheEvening => Intl.message(
        'Вечером',
        desc: 'Время суток',
        name: 'CommonI18n_inTheEvening',
      );

  static String get updateTitle => Intl.message(
        'Доступно\nобновление',
        desc: 'Заголовок обновления окна',
        name: 'CommonI18n_updateTitle',
      );

  static String get updateBtn => Intl.message(
        'Обновить',
        desc: 'Кнопка обновления окна',
        name: 'CommonI18n_updateBtn',
      );

  static String get updateDescription => Intl.message(
        'Мы добавили новые функции и повысили стабильность работы. Пожалуйста обновите JOJO',
        desc: 'Описание обновления окна',
        name: 'CommonI18n_updateDescription',
      );

  static String get dialogTariffsBtn => Intl.message(
        'Тарифы',
        desc: 'Кнопка тарифы',
        name: 'CommonI18n_dialogTariffsBtn',
      );
}
