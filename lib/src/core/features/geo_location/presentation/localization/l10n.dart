import 'package:intl/intl.dart';

class GeoLocationI18n {
  static String get title => Intl.message(
        'Выбор города',
        desc: 'Description for GeoLocation title',
        name: 'GeoLocationI18n_title',
      );

  static String get geoLocationNotFound => Intl.message(
        'GeoLocation not found',
        desc: 'Description for GeoLocation not found',
        name: 'GeoLocationI18n_geoLocationNotFound',
      );

  static String get findCity => Intl.message(
        'Найти город',
        desc: 'Найти город',
        name: 'GeoLocationI18n_findCity',
      );
}
