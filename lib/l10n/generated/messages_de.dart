// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(
    String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'de';

  static m0(value) => "${Intl.select(value, {'createdAt': 'По дате', 'compatibility': 'По совместимости', 'age': 'По возрасту', })}";

  static m1(choice) => "${Intl.select(choice, {'true': 'Эти мужчины проявили симпатию к тебе.\nОни могут не соответствовать параметрам\nтвоего подбора', 'false': 'Эти девушки проявили симпатию к тебе.\nОни могут не соответствовать параметрам\nтвоего подбора', })}";

  static m2(value) => "${Intl.select(value, {'youAreLiked': 'Ты нравишься', 'waitingForCandidate': 'Ждем ответа', 'mutualAttraction': 'Взаимность', })}";

  static m3(value) => "${Intl.plural(value, zero: '0 дней', one: '${value} день', two: '${value} дня', few: '${value} дня', many: '${value} дней', other: '${value}')}";

  static m4(value) => "${value} Км. от тебя";

  static m5(value) => "${value} см";

  static m6(value) => "${Intl.plural(value, zero: 'часов', one: 'час', two: 'часа', few: 'часа', many: 'часов', other: 'часов')}";

  static m7(value) => "${Intl.plural(value, zero: 'минут', one: 'минута', two: 'минуты', few: 'минуты', many: 'минут', other: 'минут')}";

  static m8(from, to) => "От ${from} до ${to}";

  static m9(value) => "${Intl.plural(value, zero: 'секунд', one: 'секунда', two: 'секунды', few: 'секунды', many: 'секунд', other: 'секунд')}";

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'ChatI18n_chatNotFound': MessageLookupByLibrary.simpleMessage('Chat not found'),
    'ChatI18n_title': MessageLookupByLibrary.simpleMessage('chat title'),
    'CommonI18n_dialogTariffsBtn': MessageLookupByLibrary.simpleMessage('Тарифы'),
    'CommonI18n_female': MessageLookupByLibrary.simpleMessage('Женский'),
    'CommonI18n_inTheEvening': MessageLookupByLibrary.simpleMessage('Вечером'),
    'CommonI18n_inTheMorning': MessageLookupByLibrary.simpleMessage('Утром'),
    'CommonI18n_male': MessageLookupByLibrary.simpleMessage('Мужской'),
    'CommonI18n_no': MessageLookupByLibrary.simpleMessage('Нет'),
    'CommonI18n_updateBtn': MessageLookupByLibrary.simpleMessage('Обновить'),
    'CommonI18n_updateDescription': MessageLookupByLibrary.simpleMessage('Мы добавили новые функции и повысили стабильность работы. Пожалуйста обновите JOJO'),
    'CommonI18n_updateTitle': MessageLookupByLibrary.simpleMessage('Доступно\nобновление'),
    'CommonI18n_yes': MessageLookupByLibrary.simpleMessage('Да'),
    'GeoLocationI18n_findCity': MessageLookupByLibrary.simpleMessage('Найти город'),
    'GeoLocationI18n_geoLocationNotFound': MessageLookupByLibrary.simpleMessage('GeoLocation not found'),
    'GeoLocationI18n_title': MessageLookupByLibrary.simpleMessage('Выбор города'),
    'LanguagesI18n_confirm': MessageLookupByLibrary.simpleMessage('Подтверждаю'),
    'LanguagesI18n_languagesNotFound': MessageLookupByLibrary.simpleMessage('Languages not found'),
    'LanguagesI18n_search': MessageLookupByLibrary.simpleMessage('Найти язык'),
    'LanguagesI18n_systemLanguage': MessageLookupByLibrary.simpleMessage('Язык системы'),
    'LanguagesI18n_title': MessageLookupByLibrary.simpleMessage('Языки'),
    'LikedI18n_likedNotFound': MessageLookupByLibrary.simpleMessage('Liked not found'),
    'LikedI18n_likedSortTypeTitle': m0,
    'LikedI18n_noLikes': MessageLookupByLibrary.simpleMessage('У тебя пока нет\nсимпатий'),
    'LikedI18n_noLikesHint': MessageLookupByLibrary.simpleMessage('Здесь будут анкеты мужчин, которые\nпоставили тебе лайк'),
    'LikedI18n_photoBadge': MessageLookupByLibrary.simpleMessage('NEW'),
    'LikedI18n_shownSympathy': m1,
    'LikedI18n_title': MessageLookupByLibrary.simpleMessage('Liked you'),
    'SelectionI18n_aboutAlgorithm': MessageLookupByLibrary.simpleMessage('Подробнее про алгоритм'),
    'SelectionI18n_aboutCandidate': MessageLookupByLibrary.simpleMessage('Главное о кандидате'),
    'SelectionI18n_astrologicalCompatibility': MessageLookupByLibrary.simpleMessage('Астрологическая совместимость'),
    'SelectionI18n_candidateProfile': MessageLookupByLibrary.simpleMessage('Анкета кандидата'),
    'SelectionI18n_datingStatus': m2,
    'SelectionI18n_daysPlural': m3,
    'SelectionI18n_decline': MessageLookupByLibrary.simpleMessage('Отказать'),
    'SelectionI18n_distance': m4,
    'SelectionI18n_error': MessageLookupByLibrary.simpleMessage('Ошибка'),
    'SelectionI18n_fillProfileBtn': MessageLookupByLibrary.simpleMessage('Заполнить профиль'),
    'SelectionI18n_fillProfileDescription': MessageLookupByLibrary.simpleMessage('Пока есть время, заполни свой профиль до конца и получи свидание в подарок'),
    'SelectionI18n_firstSelection': MessageLookupByLibrary.simpleMessage('Первый подбор через:'),
    'SelectionI18n_goToChat': MessageLookupByLibrary.simpleMessage('Перейти в чат'),
    'SelectionI18n_heightValue': m5,
    'SelectionI18n_hoursPlural': m6,
    'SelectionI18n_interests': MessageLookupByLibrary.simpleMessage('Интересы'),
    'SelectionI18n_languageSkills': MessageLookupByLibrary.simpleMessage('Владение языками'),
    'SelectionI18n_minutesPlural': m7,
    'SelectionI18n_moderationReject': MessageLookupByLibrary.simpleMessage('Модерация не пройдена. Рекомендации в чате'),
    'SelectionI18n_moderationTitle': MessageLookupByLibrary.simpleMessage('Идет модерация'),
    'SelectionI18n_moreDetails': MessageLookupByLibrary.simpleMessage('Подробнее'),
    'SelectionI18n_moreThanOne': MessageLookupByLibrary.simpleMessage('Больше одного'),
    'SelectionI18n_nextSelection': MessageLookupByLibrary.simpleMessage('Следующий подбор через:'),
    'SelectionI18n_noOffers': MessageLookupByLibrary.simpleMessage('Пока нет достойных девушек для тебя, но я активно ищу'),
    'SelectionI18n_searchParamsDescription': MessageLookupByLibrary.simpleMessage('Найдем для тебя идеального кандидата'),
    'SelectionI18n_searchParamsTitle': MessageLookupByLibrary.simpleMessage('Параметры поиска'),
    'SelectionI18n_searching': MessageLookupByLibrary.simpleMessage('Подбор'),
    'SelectionI18n_searchingAge': MessageLookupByLibrary.simpleMessage('Возраст'),
    'SelectionI18n_searchingCandidate': MessageLookupByLibrary.simpleMessage('Идеальный кандидат'),
    'SelectionI18n_searchingDesc': m8,
    'SelectionI18n_searchingLanguages': MessageLookupByLibrary.simpleMessage('Языки'),
    'SelectionI18n_searchingTitle': MessageLookupByLibrary.simpleMessage('Идет подбор...'),
    'SelectionI18n_secondsPlural': m9,
    'SelectionI18n_selectionNotFound': MessageLookupByLibrary.simpleMessage('Selection not found'),
    'SelectionI18n_title': MessageLookupByLibrary.simpleMessage('selection title'),
    'SelectionI18n_wantToMeet': MessageLookupByLibrary.simpleMessage('Хочу познакомиться'),
    'SplashI18n_title': MessageLookupByLibrary.simpleMessage('Splash title')
  };
}
