import 'package:intl/intl.dart';
import 'package:jojo/src/features/selection/_selection.dart';

class SelectionI18n {
  static String get title => Intl.message(
        'selection title',
        desc: 'Description for Selection title',
        name: 'SelectionI18n_title',
      );

  static String get selectionNotFound => Intl.message(
        'Selection not found',
        desc: 'Description for Selection not found',
        name: 'SelectionI18n_selectionNotFound',
      );

  static String get moderationTitle => Intl.message(
        'Идет модерация',
        desc: 'Идет модерация',
        name: 'SelectionI18n_moderationTitle',
      );

  static String get searchingTitle => Intl.message(
        'Идет подбор...',
        desc: 'Идет подбор...',
        name: 'SelectionI18n_searchingTitle',
      );

  static String get searchingCandidate => Intl.message(
        'Идеальный кандидат',
        desc: 'Идеальный кандидат',
        name: 'SelectionI18n_searchingCandidate',
      );

  static String get searchingAge => Intl.message(
        'Возраст',
        desc: 'Возраст',
        name: 'SelectionI18n_searchingAge',
      );

  static String searchingDesc(String from, String to) => Intl.message(
        'От $from до $to',
        desc: 'Возраст описание',
        name: 'SelectionI18n_searchingDesc',
        args: [from, to],
      );

  static String get searchingLanguages => Intl.message(
        'Языки',
        desc: 'Языки',
        name: 'SelectionI18n_searchingLanguages',
      );

  static String get moreDetails => Intl.message(
        'Подробнее',
        desc: 'Подробнее',
        name: 'SelectionI18n_moreDetails',
      );

  static String get error => Intl.message(
        'Ошибка',
        desc: 'Ошибка',
        name: 'SelectionI18n_error',
      );

  static String get moderationReject => Intl.message(
        'Модерация не пройдена. Рекомендации в чате',
        desc: 'Модерация не пройдена. Рекомендации в чате',
        name: 'SelectionI18n_moderationReject',
      );

  static String get searching => Intl.message(
        'Подбор',
        desc: 'Подбор',
        name: 'SelectionI18n_searching',
      );

  static String get firstSelection => Intl.message(
        'Первый подбор через:',
        desc: 'Первый подбор через',
        name: 'SelectionI18n_firstSelection',
      );

  static String get nextSelection => Intl.message(
        'Следующий подбор через:',
        desc: 'Следующий подбор через',
        name: 'SelectionI18n_nextSelection',
      );

  static String get noOffers => Intl.message(
        'Пока нет достойных девушек для тебя, но я активно ищу',
        desc: 'Пока нет достойных девушек для тебя, но я активно ищу',
        name: 'SelectionI18n_noOffers',
      );

  static String get fillProfileBtn => Intl.message(
        'Заполнить профиль',
        desc: 'Заполнить профиль',
        name: 'SelectionI18n_fillProfileBtn',
      );

  static String get fillProfileDescription => Intl.message(
        'Пока есть время, заполни свой профиль до конца и получи свидание в подарок',
        desc:
            'Пока есть время, заполни свой профиль до конца и получи свидание в подарок',
        name: 'SelectionI18n_fillProfileDescription',
      );

  static String get searchParamsTitle => Intl.message(
        'Параметры поиска',
        desc: 'Параметры поиска',
        name: 'SelectionI18n_searchParamsTitle',
      );

  static String get searchParamsDescription => Intl.message(
        'Найдем для тебя идеального кандидата',
        desc: 'Найдем для тебя идеального кандидата',
        name: 'SelectionI18n_searchParamsDescription',
      );

  static String get goToChat => Intl.message(
        'Перейти в чат',
        desc: 'Перейти в чат',
        name: 'SelectionI18n_goToChat',
      );

  static String get aboutAlgorithm => Intl.message(
        'Подробнее про алгоритм',
        desc: 'Подробнее про алгоритм',
        name: 'SelectionI18n_aboutAlgorithm',
      );

  static String get astrologicalCompatibility => Intl.message(
        'Астрологическая совместимость',
        desc: 'Астрологическая совместимость',
        name: 'SelectionI18n_astrologicalCompatibility',
      );

  static String get aboutCandidate => Intl.message(
        'Главное о кандидате',
        desc: 'Главное о кандидате',
        name: 'SelectionI18n_aboutCandidate',
      );

  static String get candidateProfile => Intl.message(
        'Анкета кандидата',
        desc: 'Анкета кандидата',
        name: 'SelectionI18n_candidateProfile',
      );

  static String distance(num value) => Intl.message(
        '$value Км. от тебя',
        desc: ' Км. от тебя',
        args: [value],
        name: 'SelectionI18n_distance',
      );

  static String get distanceLabel => Intl.message(
        'Расстояние',
        desc: ' Расстояние',
        name: 'SelectionI18n_distanceLabel',
      );

  static String daysPlural(int value) => Intl.plural(
        value,
        zero: '0 дней',
        one: '$value день',
        two: '$value дня',
        few: '$value дня',
        many: '$value дней',
        other: '$value',
        desc: 'Дней',
        name: 'SelectionI18n_daysPlural',
        args: [value],
      );

  static String hoursPlural(int value) => Intl.plural(
        value,
        zero: 'часов',
        one: 'час',
        two: 'часа',
        few: 'часа',
        many: 'часов',
        other: 'часов',
        desc: 'Часы',
        name: 'SelectionI18n_hoursPlural',
        args: [value],
      );

  static String minutesPlural(int value) => Intl.plural(
        value,
        zero: 'минут',
        one: 'минута',
        two: 'минуты',
        few: 'минуты',
        many: 'минут',
        other: 'минут',
        desc: 'минут',
        name: 'SelectionI18n_minutesPlural',
        args: [value],
      );

  static String secondsPlural(int value) => Intl.plural(
        value,
        zero: 'секунд',
        one: 'секунда',
        two: 'секунды',
        few: 'секунды',
        many: 'секунд',
        other: 'секунд',
        desc: 'секунд',
        name: 'SelectionI18n_secondsPlural',
        args: [value],
      );

  static String datingStatus(Object value) => Intl.select(
        value,
        {
          OfferStatus.youAreLiked: 'Ты нравишься',
          OfferStatus.waitingForCandidate: 'Ждем ответа',
          OfferStatus.mutualAttraction: 'Взаимность',
        },
        desc: 'Статус предложения',
        name: 'SelectionI18n_datingStatus',
        args: [value],
      );

  static String heightValue(num value) => Intl.message(
        '$value см',
        name: 'SelectionI18n_heightValue',
        args: [value],
      );

  static String get moreThanOne => Intl.message(
        'Больше одного',
        name: 'SelectionI18n_moreThanOne',
      );

  static String get interests => Intl.message(
        'Интересы',
        name: 'SelectionI18n_interests',
      );

  static String get languageSkills => Intl.message(
        'Владение языками',
        name: 'SelectionI18n_languageSkills',
      );

  static String get wantToMeet => Intl.message(
        'Хочу познакомиться',
        name: 'SelectionI18n_wantToMeet',
      );

  static String get decline => Intl.message(
        'Отказать',
        name: 'SelectionI18n_decline',
      );

  static String get compatibility => Intl.message(
        'Совместимость',
        name: 'SelectionI18n_compatibility',
      );

  static String get astrologicalLess18Title => Intl.message(
        '<18 баллов',
        name: 'SelectionI18n_astrologicalLess18Title',
      );

  static String get astrological1825Title => Intl.message(
        '18-25 баллов',
        name: 'SelectionI18n_astrological1825Title',
      );

  static String get astrological2532Title => Intl.message(
        '25-32 балла',
        name: 'SelectionI18n_astrological2532Title',
      );

  static String get astrologicalMore32Title => Intl.message(
        '>32 Баллов',
        name: 'SelectionI18n_astrologicalMore32Title',
      );

  static String get astrologicalLess18Desc => Intl.message(
        'Нелегкие взаимоотношения которые требуют усердной работы.',
        name: 'SelectionI18n_astrologicalLess18Desc',
      );

  static String get astrological1825Desc => Intl.message(
        'Средний показатель, который позволит создать стабильные отношения.',
        name: 'SelectionI18n_astrological1825Desc',
      );

  static String get astrological2532Desc => Intl.message(
        'Очень хороший показатель. Пара имеет все шансы создать крепкие и счастливые отношения.',
        name: 'SelectionI18n_astrological2532Desc',
      );

  static String get astrologicalMore32Desc => Intl.message(
        'Идеальный вариант. В большинстве случаев это взаимная любовь с первого взгляда.',
        name: 'SelectionI18n_astrologicalMore32Desc',
      );

  static String get detailInfo => Intl.message(
        'Детальная информация',
        name: 'SelectionI18n_detailInfo',
      );

  // "information": {
  //   "title": "Детальная информация",
  //   "Varna": "Ментальный \nи интеллектуальный уровень",
  //   "Vashya": "Взаимное \nвлечение",
  //   "Dina": "Согласие в повседневной \nжизни",
  //   "Yoni": "Сексуальная и физическая совместимость",
  //   "Grahamaitri": "Психологическая совместимость \nи эмоциональный комфорт",
  //   "Gana": "Совместимость характеров \nи темпераментов",
  //   "Rasi": "Уровень процветания \nи благосостояния",
  //   "Nadi": "Энергетическая совместимость, наследственность"
  // }
}
