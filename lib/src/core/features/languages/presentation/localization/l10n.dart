import 'package:intl/intl.dart';

class LanguagesI18n {
  static String get title => Intl.message(
        'Языки',
        desc: 'Description for Languages title',
        name: 'LanguagesI18n_title',
      );

  static String get confirm => Intl.message(
        'Подтверждаю',
        desc: 'confirm',
        name: 'LanguagesI18n_confirm',
      );

  static String get languagesNotFound => Intl.message(
        'Languages not found',
        desc: 'Description for Languages not found',
        name: 'LanguagesI18n_languagesNotFound',
      );

  static String get search => Intl.message(
        'Найти язык',
        desc: 'LanguagesI18n',
        name: 'LanguagesI18n_search',
      );

  static String get systemLanguage => Intl.message(
        'Язык системы',
        desc: 'systemLanguage',
        name: 'LanguagesI18n_systemLanguage',
      );
}
