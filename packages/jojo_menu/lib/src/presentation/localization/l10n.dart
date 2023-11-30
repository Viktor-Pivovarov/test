// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';

class MenuI18n {
  static String get title => Intl.message(
        'Меню',
        desc: 'Description for Menu title',
        name: 'MenuI18n_title',
      );

  static String get menuNotFound => Intl.message(
        'Menu not found',
        desc: 'Description for Menu not found',
        name: 'MenuI18n_menuNotFound',
      );

  static String get aboutJojo => Intl.message(
        'Про jojo',
        desc: 'Description for Menu not found',
        name: 'MenuI18n_aboutJojo',
      );

  static String appVersion(String version) => Intl.message(
        'Версия приложения $version',
        name: 'MenuI18n_appVersion',
        desc: 'Application version',
        args: [version],
      );

  static String get aboutJojoExplain => Intl.message(
        'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. ',
        name: 'MenuI18n_aboutJojoExplain',
        desc: 'About Jojo explain',
      );

  static String get termsOfUse => Intl.message(
        'Пользовательское соглашение',
        desc: 'Terms of use',
        name: 'MenuI18n_termsOfUse',
      );

  static String get personalDataProcessing => Intl.message(
        'Обработка персональных данных',
        desc: 'Personal data processing',
        name: 'MenuI18n_personalDataProcessing',
      );

  static String get privacyPolicy => Intl.message(
        'Политика конфиденциальности',
        desc: 'Privacy policy',
        name: 'MenuI18n_privacyPolicy',
      );

  static String get supporting => Intl.message(
        'Поддержка',
        desc: 'Supporting',
        name: 'MenuI18n_supporting',
      );

  static String get supportingHint => Intl.message(
        'FAQ и тех. поддержка',
        desc: 'FAQ and supporting',
        name: 'MenuI18n_supportingHint',
      );

  static String get settings => Intl.message(
        'Настройки',
        desc: 'Settings',
        name: 'MenuI18n_settings',
      );

  static String get settingsHint => Intl.message(
        'Язык приложения и другие настройки',
        desc: 'Application language and other settings',
        name: 'MenuI18n_settingsHint',
      );

  static String get activateHints => Intl.message(
        'Активируй подсказки',
        desc: 'Activate hints',
        name: 'MenuI18n_activateHints',
      );

  static String get activateHintsDescription => Intl.message(
        'Помогает увеличить количество и качество знакомств',
        desc: 'Helps to increase the quantity and quality of dating',
        name: 'MenuI18n_activateHintsDescription',
      );

  static String get algorithm => Intl.message(
        'Алгоритм подбора',
        desc: 'Selection algorithm',
        name: 'MenuI18n_algorithm',
      );

  static String get algorithmHint => Intl.message(
        'Узнать',
        desc: 'Find out',
        name: 'MenuI18n_algorithmHint',
      );

  static String get myStats => Intl.message(
        'Моя статистика',
        desc: 'My stats',
        name: 'MenuI18n_myStats',
      );

  static String get myStatsHint => Intl.message(
        'Проанализировать',
        desc: 'Analyze',
        name: 'MenuI18n_myStatsHint',
      );

  static String get freeDates => Intl.message(
        'Бесплатные встречи',
        desc: 'Free dates',
        name: 'MenuI18n_freeDates',
      );

  static String get freeDatesHint => Intl.message(
        'Активировать',
        desc: 'Активировать',
        name: 'MenuI18n_freeDatesHint',
      );

  static String get tariffs => Intl.message(
        'Тарифы и оплата',
        desc: 'Tariffs and payment',
        name: 'MenuI18n_freeDatesHint',
      );

  static String get tariffsHint => Intl.message(
        'Начни действовать',
        desc: 'Take action',
        name: 'MenuI18n_tariffsHint',
      );

  static String get available => Intl.message(
        'Доступно',
        desc: 'Available',
        name: 'MenuI18n_available',
      );

  static String get dates => Intl.message(
        'Cвиданий',
        desc: 'Dates',
        name: 'MenuI18n_dates',
      );

  static String get haveIssue => Intl.message(
        'Есть проблема?',
        desc: 'Have a issue?',
        name: 'MenuI18n_haveIssue',
      );

  static String get contactUs => Intl.message(
        'Напишите нам',
        desc: 'Contact us',
        name: 'MenuI18n_contactUs',
      );

  static String get faq => Intl.message(
        'Часто задаваемые вопросы',
        desc: 'FAQ',
        name: 'MenuI18n_faq',
      );

  static String get totalCandidates => Intl.message(
        'Всего\nкандидатов',
        desc: 'totalCandidates',
        name: 'MenuI18n_totalCandidates',
      );

  static String get mutualSympathy => Intl.message(
        'Взаимная\nсимпатия',
        desc: 'mutualSympathy',
        name: 'MenuI18n_mutualSympathy',
      );

  static String get youLiked => Intl.message(
        'Тебе\nпонравилось',
        desc: 'youLiked',
        name: 'MenuI18n_youLiked',
      );

  static String get youSaidNo => Intl.message(
        'Ты \nотказал',
        desc: 'youLiked',
        name: 'MenuI18n_youSaidNo',
      );

  static String get candidates => Intl.message(
        'Кандидаты',
        desc: 'Сandidates',
        name: 'MenuI18n_candidates',
      );
  static String get statistics => Intl.message(
        'Статистика',
        desc: 'Statistics',
        name: 'MenuI18n_statistics',
      );

  static String acquaintancesPlural(int value) => Intl.plural(
        value,
        zero: 'Acquaintance',
        one: 'Acquaintance',
        two: 'Acquaintances',
        few: 'Acquaintances',
        many: 'Acquaintances',
        other: 'Acquaintances',
        desc: 'Acquaintances',
        name: 'MenuI18n_Acquaintances',
      );

  static String get whenPay => Intl.message(
        'Когда платят - знакомство становится',
        desc: 'Когда платят - знакомство становится',
        name: 'MenuI18n_whenPay',
      );

  static String get valuable => Intl.message(
        'ценно',
        desc: 'ценно',
        name: 'MenuI18n_valuable',
      );

  static String get writeOffOccurs => Intl.message(
        'The write-off occurs with mutual sympathy. \nIf there is no dialogue within 10 days, the match disappears and the acquaintance is returned to the balance.',
        desc: 'ценно',
        name: 'MenuI18n_writeOffOccurs',
      );
  static String get tariffsAndPayment => Intl.message(
        'Тарифы и оплата',
        desc: 'Тарифы и оплата',
        name: 'MenuI18n_tariffsAndPayment',
      );

  static String get selectionAlgorithm => Intl.message(
        'Алгоритм подбора',
        desc: 'ценно',
        name: 'MenuI18n_selectionAlgorithm',
      );

  static String get synastry => Intl.message(
        'Synastry - analysis of the compatibility of partners according to their natal charts.',
        desc: 'Synastry',
        name: 'MenuI18n_synastry',
      );

  static String get synastryFact1 => Intl.message(
        'The main deal in life is to find exactly your soul mate.',
        desc: 'SynastryFact1',
        name: 'MenuI18n_synastryFact1',
      );

  static String get synastryFact2 => Intl.message(
        "Just because you don't believe in something doesn't mean it doesn't exist.",
        desc: 'SynastryFact2',
        name: 'MenuI18n_synastryFact2',
      );

  static String get synastryFact3 => Intl.message(
        'We rely on facts and statistics.',
        desc: 'SynastryFact3',
        name: 'MenuI18n_synastryFact3',
      );

  static String get examplesOfCouples => Intl.message(
        'Examples of couples with good astrological compatibility.',
        desc: 'Examples of couples with good astrological compatibility.',
        name: 'MenuI18n_examplesOfCouples',
      );

  static String get astrologicalCompatibility => Intl.message(
        'Астрологическая совместимость',
        desc: 'Астрологическая совместимость',
        name: 'MenuI18n_astrologicalCompatibility',
      );

  static String get davidAndVictoria => Intl.message(
        'David and Victoria Beckham',
        desc: 'David and Victoria Beckham',
        name: 'MenuI18n_davidAndVictoria',
      );

  static String get willAndJada => Intl.message(
        'Will and Jada Pinkett Smith',
        desc: 'Will and Jada Pinkett Smith',
        name: 'MenuI18n_willAndJada',
      );

  static String get alexseyAndYulia => Intl.message(
        'Alexey and Yulia Navalny',
        desc: 'Alexey and Yulia Navalny',
        name: 'MenuI18n_alexseyAndYulia',
      );

  static String get messi => Intl.message(
        'Lionel Messi and Antonella Roccuzzo',
        desc: 'Lionel Messi and Antonella Roccuzzo',
        name: 'MenuI18n_messi',
      );

  static String get zidan => Intl.message(
        'Zinedine and Veronica Zidane',
        desc: 'Zinedine and Veronica Zidane',
        name: 'MenuI18n_zidan',
      );

  static String get meryl => Intl.message(
        'Meryl Streep and Don Gamper',
        desc: 'Meryl Streep and Don Gamper',
        name: 'MenuI18n_meryl',
      );

  static String get married => Intl.message(
        'Married',
        desc: 'Married',
        name: 'MenuI18n_married',
      );

  static String get children => Intl.message(
        'Children',
        desc: 'Children',
        name: 'MenuI18n_children',
      );

  static String get ashtakuta => Intl.message(
        'Ashtakuta',
        desc: 'Ashtakuta',
        name: 'MenuI18n_ashtakuta',
      );

  static String get ashtakutaParagraph1 => Intl.message(
        '(Ashta=8, Kuta=factor) - is one of the most popular synastric systems in Jyotish (Eastern Astrology), compatibility based on 8 important aspects of living together.',
        desc: 'Ashtakuta Paragraph #1',
        name: 'MenuI18n_ashtakutaParagraph1',
      );

  static String get ashtakutaParagraph2 => Intl.message(
        'Calculation according to eight criteria (Ashtakuta) is a very ancient method of checking compatibility (about 5000 years). It takes into account not only the main zodiac signs of the partners, but also the ascendant (ascendant) and lunar sign of the partners and how compatible they are, the location of the planets in your natal charts is taken into account, which show the strengths and weaknesses of the partners in relation to each other.',
        desc: 'Ashtakuta Paragraph #2',
        name: 'MenuI18n_ashtakutaParagraph2',
      );

  static String get ashtakutaParagraph3 => Intl.message(
        'This system is widespread in Asian countries, especially in India. By the way, there is also the smallest percentage of divorces, only 1.5 - 3% of unions break up.',
        desc: 'Ashtakuta Paragraph #3',
        name: 'MenuI18n_ashtakutaParagraph3',
      );

  static String get ashtakutaParagraph4 => Intl.message(
        'We also conducted our own research and checked over 320 couples who have been in a serious relationship for more than 3 years. 86% of couples who broke up had a weak astrological synastry.',
        desc: 'Ashtakuta Paragraph #4',
        name: 'MenuI18n_ashtakutaParagraph4',
      );

  static String get varnaKuta => Intl.message(
        'Varna Kuta',
        desc: 'Varna Kuta',
        name: 'MenuI18n_varnaKuta',
      );

  static String get varnaKutaDescription => Intl.message(
        'Thinking and Compatibility on an Intellectual Level',
        desc: 'Thinking and Compatibility on an Intellectual Level',
        name: 'MenuI18n_varnaKutaDescription',
      );

  static String get vashyaKuta => Intl.message(
        'Vashya Kuta',
        desc: 'Vashya Kuta',
        name: 'MenuI18n_vashyaKuta',
      );

  static String get vashyaKutaDescription => Intl.message(
        'The power of mutual attraction of partners',
        desc: 'The power of mutual attraction of partners',
        name: 'MenuI18n_vashyaKutaDescription',
      );

  static String get taraKuta => Intl.message(
        'Tara (Dina) Kuta',
        desc: 'Tara (Dina) Kuta',
        name: 'MenuI18n_taraKuta',
      );

  static String get taraKutaDescription => Intl.message(
        'Potential Lifespan',
        desc: 'Potential Lifespan',
        name: 'MenuI18n_taraKutaDescription',
      );

  static String get yoniKuta => Intl.message(
        'Yoni Kuta',
        desc: 'Yoni Kuta',
        name: 'MenuI18n_yoniKuta',
      );

  static String get yoniKutaDescription => Intl.message(
        'Physical and sexual compatibility',
        desc: 'Potential Lifespan',
        name: 'MenuI18n_yoniKutaDescription',
      );

  static String get grahamayatiKuta => Intl.message(
        'Grahamayati Kuta',
        desc: 'Grahamayati Kuta',
        name: 'MenuI18n_grahamayatiKuta',
      );

  static String get grahamayatiKutaDescription => Intl.message(
        'Psychological compatibility',
        desc: 'Psychological compatibility',
        name: 'MenuI18n_grahamayatiKutaDescription',
      );

  static String get ghanaKuta => Intl.message(
        'Ghana Kuta',
        desc: 'Ghana Kuta',
        name: 'MenuI18n_ghanaKuta',
      );

  static String get ghanaKutaDescription => Intl.message(
        'Long-term relationship',
        desc: 'Long-term relationship',
        name: 'MenuI18n_ghanaKutaDescription',
      );

  static String get bhakutKuta => Intl.message(
        'Bhakut (Rashi) Kuta',
        desc: 'Bhakut (Rashi) Kuta',
        name: 'MenuI18n_bhakutKuta',
      );

  static String get bhakutKutaDescription => Intl.message(
        'Harmony, blogging and luck',
        desc: 'Harmony, blogging and luck',
        name: 'MenuI18n_bhakutKutaDescription',
      );

  static String get nadiKuta => Intl.message(
        'Nadi Kuta',
        desc: 'Nadi Kuta',
        name: 'MenuI18n_nadiKuta',
      );

  static String get nadiKutaDescription => Intl.message(
        'Having children, favorable heredity',
        desc: 'Having children, favorable heredity',
        name: 'MenuI18n_nadiKutaDescription',
      );

  static String get save => Intl.message(
        'Save',
        desc: 'Save',
        name: 'MenuI18n_save',
      );

  static String get kutasFinal => Intl.message(
        'All these factors (Kutas) are considered in aggregate, and an assessment is made in points, the maximum number of which can be 36. The more points, the more attractive alchemy in relationships.',
        desc:
            'All these factors (Kutas) are considered in aggregate, and an assessment is made in points, the maximum number of which can be 36. The more points, the more attractive alchemy in relationships.',
        name: 'MenuI18n_kutasFinal',
      );

  static String get points => Intl.message(
        'points',
        desc: 'points',
        name: 'MenuI18n_points',
      );

  static String get harmony => Intl.message(
        'Harmony,\nblogging and\nluck',
        desc: 'Harmony, blogging and luck',
        name: 'MenuI18n_harmony',
      );

  static String get normalUnion => Intl.message(
        'normal union,\nwhich will allow\ncreate an average\nfamily',
        desc: 'normal union, which will allow create an average\nfamily',
        name: 'MenuI18n_harmony',
      );

  static String get veryGood => Intl.message(
        'Very good\nindicator, all chances to create a happy family',
        desc: 'Very good indicator, all chances to create a happy family',
        name: 'MenuI18n_veryGood',
      );

  static String get great => Intl.message(
        'This is great,\nperfect',
        desc: 'This is great, perfect',
        name: 'MenuI18n_great',
      );

  static String get applicationLanguages => Intl.message(
        'Язык приложения',
        desc: 'Application language',
        name: 'MenuI18n_applicationLanguages',
      );

  static String get english => Intl.message(
        'English',
        desc: 'English',
        name: 'MenuI18n_english',
      );

  static String get deutsch => Intl.message(
        'Deutsch',
        desc: 'Deutsch',
        name: 'MenuI18n_deutsch',
      );

  static String get italiano => Intl.message(
        'Italiano',
        desc: 'Italiano',
        name: 'MenuI18n_italiano',
      );

  static String get french => Intl.message(
        'Français',
        desc: 'Français',
        name: 'MenuI18n_french',
      );

  static String get russian => Intl.message(
        'Russian',
        desc: 'Russian',
        name: 'MenuI18n_russian',
      );

  static String get notifications => Intl.message(
        'Уведомления',
        desc: 'Notifications',
        name: 'MenuI18n_notifications',
      );

  static String get active => Intl.message(
        'Активны',
        desc: 'Active',
        name: 'MenuI18n_active',
      );

  static String get blacklist => Intl.message(
        'Черный список',
        desc: 'blacklist',
        name: 'MenuI18n_blacklist',
      );

  static String blacklistedPlural(int value) => Intl.plural(
        value,
        zero: 'Нет заблокированных пользователей',
        one: '$value заблокированный пользователь',
        two: '$value заблокированных пользователя',
        few: '$value заблокированных пользователя',
        many: '$value заблокированных пользователей',
        other: '$value заблокированных пользователей',
        desc: 'blacklistedPlural',
        name: 'MenuI18n_blacklistedPlural',
      );

  static String get logout => Intl.message(
        'Выйти из аккаунта',
        desc: 'Log out',
        name: 'MenuI18n_logout',
      );

  static String get comeBack => Intl.message(
        'Вы можете вернуться в любой момент',
        desc: 'comeBack',
        name: 'MenuI18n_comeBack',
      );

  static String get freezeAccount => Intl.message(
        'Заморозить',
        desc: 'Freeze account',
        name: 'MenuI18n_freezeAccount',
      );

  static String get freezeAccountDescription => Intl.message(
        'Ваш аккаунт будет временно заморожен',
        desc: 'Your account will be temporarily frozen',
        name: 'MenuI18n_freezeAccountDescription',
      );

  static String get deleteAccount => Intl.message(
        'Удалить аккаунт',
        desc: 'Delete account',
        name: 'MenuI18n_deleteAccount',
      );

  static String get deleteAccountDescription => Intl.message(
        'Если он больше не нужен',
        desc: 'If it s no longer needed',
        name: 'MenuI18n_deleteAccountDescription',
      );

  static String get acq => Intl.message(
        'acq',
        desc: 'acq',
        name: 'MenuI18n_acq',
      );

  static String get freezeAccountTitle => Intl.message(
        'Заморозить аккаунт',
        desc: 'Freeze account',
        name: 'MenuI18n_freezeAccountTitle',
      );

  static String get accountWillBeFrozen => Intl.message(
        'Аккаунт будет заморожен',
        desc: 'The account will be frozen',
        name: 'MenuI18n_accountWillBeFrozen',
      );

  static String get accountWillBeFrozenDescription => Intl.message(
        'Это остановит подбор и позволит сохранить данные, чтобы не повторять регистрацию при следующей потребности в знакомствах. Твой баланс свиданий будет сохранен.',
        desc: 'accountWillBeFrozenDescription',
        name: 'MenuI18n_accountWillBeFrozenDescription',
      );

  static String get accountFrozen => Intl.message(
        'Аккаунт заморожен',
        desc: 'Account frozen',
        name: 'MenuI18n_accountFrozen',
      );

  static String get selectionTemporarilyStopped => Intl.message(
        'Подбор временно остановлен',
        desc: 'Selection is temporarily stopped',
        name: 'MenuI18n_selectionTemporarilyStopped',
      );

  static String get selectionTemporarilyStoppedDescription => Intl.message(
        'Ваш аккаунт был заморожен. Мы сохранили все ваши данные и историю подборов.',
        desc:
            'Your account has been frozen. We have saved all your data and selection history.',
        name: 'MenuI18n_selectionTemporarilyStoppedDescription',
      );

  static String get unfreezeAccount => Intl.message(
        'Разморозить аккаунт',
        desc: 'Unfreeze account',
        name: 'MenuI18n_unfreezeAccount',
      );

  static String get yourAccountWillBeDeleted => Intl.message(
        'Твой аккаунт будет удален',
        desc: 'Your account will be deleted',
        name: 'MenuI18n_yourAccountWillBeDeleted',
      );

  static String get yourAccountWillBeDeletedDescription => Intl.message(
        'Но ты можешь заморозить аккаунт, чтобы сохранить данные и баланс свиданий. В таком случае тебе не придется проходить регистрацию заново при новой потребности в знакомствах.',
        desc: 'Your account will be deleted',
        name: 'MenuI18n_yourAccountWillBeDeletedDescription',
      );

  static String get confirmation => Intl.message(
        'Подтверждение',
        desc: 'Confirmation',
        name: 'MenuI18n_confirmation',
      );

  static String get confirmationDescription => Intl.message(
        'If you delete your account, you will lose access to rebound history, chats, and your account. You will have 30 days to return',
        desc:
            'If you delete your account, you will lose access to rebound history, chats, and your account. You will have 30 days to return',
        name: 'MenuI18n_confirmationDescription',
      );

  static String get whyDoYouWantToDelete => Intl.message(
        'Почему вы хотите удалить аккаунт?',
        desc: 'Why do you want to delete your account?',
        name: 'MenuI18n_whyDoYouWantToDelete',
      );

  static String get language => Intl.message(
        'Язык',
        desc: 'Language',
        name: 'MenuI18n_language',
      );

  static String get unblock => Intl.message(
        'Разблокировать',
        desc: 'Unblock',
        name: 'MenuI18n_unblock',
      );

  static String get age => Intl.message(
        'Age',
        desc: 'Age',
        name: 'MenuI18n_age',
      );

  static String get newSelection => Intl.message(
        'Новый подбор',
        desc: 'Новый подбор',
        name: 'MenuI18n_newSelection',
      );

  static String get mutualSympathyNotification => Intl.message(
        'Взаимная симпатия',
        desc: 'Взаимная симпатия',
        name: 'MenuI18n_mutualSympathyNotification',
      );

  static String get chatMessages => Intl.message(
        'Сообщения в чате',
        desc: 'Сообщения в чате',
        name: 'MenuI18n_chatMessages',
      );

  static String get completeProfile => Intl.message(
        'Заполни профиль на 100%',
        desc: 'Заполни профиль на 100%',
        name: 'MenuI18n_completeProfile',
      );

  static String get completeProfileContent => Intl.message(
        'Это улучшит подбор кандидатов и мы подарим тебе одно свидание',
        desc: 'Это улучшит подбор кандидатов и мы подарим тебе одно свидание',
        name: 'MenuI18n_completeProfileContent',
      );

  static String get completeProfileBtn => Intl.message(
        'Заполнить',
        desc: 'Заполнить',
        name: 'MenuI18n_completeProfileBtn',
      );

  static String get review => Intl.message(
        'Оставь отзыв',
        desc: 'Оставь отзыв',
        name: 'MenuI18n_review',
      );

  static String get reviewContent => Intl.message(
        'Отзыв можно оставить после 24 часов использования приложения или после первого знакомства.',
        desc:
            'Отзыв можно оставить после 24 часов использования приложения или после первого знакомства.',
        name: 'MenuI18n_reviewContent',
      );

  static String get reviewBtn => Intl.message(
        'Продолжить',
        desc: 'Продолжить',
        name: 'MenuI18n_reviewBtn',
      );

  static String get giftDate => Intl.message(
        'Подари другу свидание',
        desc: 'Подари другу свидание',
        name: 'MenuI18n_giftDate',
      );
  static String get giftDateBtn => Intl.message(
        'Поделиться',
        desc: 'Поделиться',
        name: 'MenuI18n_giftDateBtn',
      );

  static String get giftDateContent => Intl.message(
        'Поделись ссылкой с одиноким другом. Когда он зарегистрируется, вы оба получите свидание в подарок.',
        desc: 'giftDateContent',
        name: 'MenuI18n_giftDateContent',
      );

  static String get giftDateContent2 => Intl.message(
        'Количество приглашенных друзей не ограничено. \n\nБонус станет доступен после прохождения другом модерации',
        desc: 'giftDateContent2',
        name: 'MenuI18n_giftDateContent2',
      );

  static String get completed => Intl.message(
        'Выполнено',
        desc: 'Выполнено',
        name: 'MenuI18n_completed',
      );

  static String reviewDescription(int index) => Intl.select(
        index,
        {
          0: 'Оцени мою работу',
          1: 'Ужасно',
          2: 'Плохо',
          3: 'Ну такое ...',
          4: 'Хорошо',
          5: 'Отлично!',
        },
        desc: 'review description',
        name: 'MenuI18n_reviewDescription',
        args: [index],
      );

  static String get reviewDescription2 => Intl.message(
        'Это помогает нам становится лучше и мотивирует нас',
        desc: 'Это помогает нам становится лучше и мотивирует нас',
        name: 'MenuI18n_reviewDescription2',
      );

  static String get send => Intl.message(
        'Отправить',
        desc: 'Отправить',
        name: 'MenuI18n_send',
      );

  static String get reviewHint => Intl.message(
        'За отзыв, с меня одно \nсвидание в подарок)',
        desc: 'За отзыв, с меня одно свидание в подарок)',
        name: 'MenuI18n_reviewHint',
      );

  static String get yourComment => Intl.message(
        'Ваш комментарий',
        desc: 'Ваш комментарий',
        name: 'MenuI18n_yourComment',
      );
}
