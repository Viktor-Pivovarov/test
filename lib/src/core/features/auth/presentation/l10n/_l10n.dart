// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class WelcomeSheetI18n {
  static String get title => Intl.message(
        'Hi! I am JOJO - your personal matchmaker',
        desc: 'Title on welcome page',
        name: 'WelcomeSheetI18n_title',
      );
}

class SignInI18n {
  static String get title => Intl.message(
        'Вход',
        desc: 'Заголовок на экране входа',
        name: 'SignInI18n_title',
      );

  static String get signUpWithTG => Intl.message(
        'Продолжить с Telegram',
        desc: 'Название кнопки входа Telegram',
        name: 'SignInI18n_signUpWithTG',
      );

  static String get tgAdditional => Intl.message(
        'Дополнительные возможности',
        desc: 'Дополнительные возможности',
        name: 'SignInI18n_tgAdditional',
      );

  static String get signUpWithApple => Intl.message(
        'Продолжить с Apple',
        desc: 'Название кнопки входа Apple',
        name: 'SignInI18n_signUpWithApple',
      );

  static String get signUpWithGoogle => Intl.message(
        'Продолжить с Google',
        desc: 'Название кнопки входа Google',
        name: 'SignInI18n_signUpWithGoogle',
      );

  static String get privacy => Intl.message(
        'By entering you agree to the `Terms of Use` & `Privacy Policy`',
        name: 'SignInI18n_privacy',
      );

  static String get createAccount => Intl.message(
        'Создать новый аккаунт',
        name: 'SignInI18n_createAccount',
      );

  static String get support => Intl.message(
        'Написать в поддержку',
        name: 'SignInI18n_support',
      );

  static String accountNotFoundTitle(Object choice) => Intl.select(
        choice,
        <Object, String>{
          SignUpType.appleId: 'Apple ID не найден',
          SignUpType.google: 'Аккаунт Google\nне найден',
        },
        desc: 'Заголовок на экране аккаунт не найден',
        name: 'SignInI18n_accountNotFoundTitle',
        args: [choice],
      );

  static String accountNotFoundDescription(Object choice) => Intl.select(
        choice,
        <Object, String>{
          SignUpType.appleId:
              'Мы не нашли аккаунт JOJO\nпривязанный к данному\nApple ID',
          SignUpType.google:
              'Мы не нашли аккаунт JOJO\nпривязанный к данному\nаккаунту Google',
        },
        desc: 'Описание на экране аккаунт не найден',
        name: 'SignInI18n_accountNotFoundDescription',
        args: [choice],
      );

  static String get chooseYourSex => Intl.message(
        'Пожалуйста,\nукажи свой пол*',
        desc: 'Лэйбл на экране выбора пола',
        name: 'SignInI18n_chooseYourSex',
      );

  static String get yourSexHint => Intl.message(
        '*Версия приложения для LGBTQ+\nперсон в разработке. `Подробнее`',
        desc: 'Подсказка на экране выбора пола?',
        name: 'SignInI18n_yourSexHint',
      );

  static String get astrologicalTitle => Intl.message(
        'Алгоритм подбора анализирует 17 параметров',
        desc: 'Заголовок на экране выбора астрологии',
        name: 'SignInI18n_astrologicalTitle',
      );

  static String get astrologicalDescription => Intl.message(
        'Учитывать\nастрологические аспекты?',
        desc: 'Описание на экране выбора астрологии',
        name: 'SignInI18n_astrologicalDescription',
      );

  static String get astrologicalShowBtn => Intl.message(
        'Нет',
        desc: 'Кнопка выбора астрологии',
        name: 'SignInI18n_astrologicalShowBtn',
      );

  static String get astrologicalRequiredBtn => Intl.message(
        'Да',
        desc: 'Кнопка выбора астрологии',
        name: 'SignInI18n_astrologicalRequiredBtn',
      );

  static String verificationTitle(Object choice) => Intl.select(
        choice,
        <Object, String>{
          true: 'Все девушки \nпроходят \nверификацию',
          false: 'Все мужчины \nпроходят \nверификацию',
        },
        desc: 'Заголовок на экране подтверждения для мужчин',
        name: 'SignInI18n_verificationTitle',
        args: [choice],
      );

  static String get verificationNotReadyTitle => Intl.message(
        'Верификация займет всего минуту',
        desc: 'verificationNotReadyTitle',
        name: 'SignInI18n_verificationNotReadyTitle',
      );

  static String verificationDescription(Object choice) => Intl.select(
        choice,
        <Object, String>{
          true: 'А ты готов пройти \nпроверку?',
          false: 'А ты готова \nпройти \nпроверку?',
        },
        desc: 'Заголовок на экране подтверждения для мужчин',
        name: 'SignInI18n_verificationDescription',
        args: [choice],
      );

  static String get verificationNotDescription => Intl.message(
        'Зарегистрироваться без проверки нельзя. Необходимо повторить жест и сделать селфи. Образец',
        desc: 'verificationNotDescription',
        name: 'SignInI18n_verificationNotDescription',
      );

  static String get checkNotificationTitle => Intl.message(
        'Получай\nуведомления',
        desc: 'checkNotificationTitle',
        name: 'SignInI18n_checkNotificationTitle',
      );

  static String get reportOnlyImportant => Intl.message(
        'Сообщаем только важное',
        desc: 'We report only important',
        name: 'SignInI18n_reportOnlyImportant',
      );

  static String checkNotificationDescription(String value) => Intl.select(
        value,
        {
          'v0': 'Новый ежедневный подбор',
          'v1': 'Взаимная симпатия',
          'v2': 'Сообщение в чате',
        },
        args: [value],
        desc: 'checkNotificationDescription',
        name: 'SignInI18n_checkNotificationDescription',
      );

  static String notificationTitle(Object choice) => Intl.select(
        choice,
        <Object, String>{
          true: 'Ежедневно делается подборка из нескольких девушек',
          false: 'Ежедневно делается подборка из нескольких мужчин',
        },
        desc: 'Заголовок на экране подтверждения для мужчин',
        name: 'SignInI18n_notificationTitle',
        args: [choice],
      );

  static String notificationDescription(Object choice) => Intl.select(
        choice,
        <Object, String>{
          true: 'Когда присылать их \nанкеты?',
          false: 'Когда присылать их \nанкеты?',
        },
        desc: 'Описание на экране подтверждения для мужчин',
        name: 'SignInI18n_notificationDescription',
        args: [choice],
      );

  static String paymentTitle(Object choice) => Intl.select(
        choice,
        <Object, String>{
          true: 'Оплата за свидания. За знакомства \nплатят оба',
          false: 'Оплата за свидания. За знакомства \nплатят оба',
        },
        desc: 'Заголовок на экране подтверждения оплаты для мужчин',
        name: 'SignInI18n_paymentTitle',
        args: [choice],
      );

  static String paymentDescription(Object choice) => Intl.select(
        choice,
        <Object, String>{
          true: 'Ты готов платить \nза результат?',
          false: 'Ты готова платить \nза результат?',
        },
        desc: 'Описание на экране подтверждения оплаты для мужчин',
        name: 'SignInI18n_paymentDescription',
        args: [choice],
      );

  static String get continueRegistrationTitle => Intl.message(
        'Пройти\nрегистрацию без\nпроверки — нельзя',
        desc: 'Заголовок на экране продолжения регистрации',
        name: 'SignInI18n_continueRegistrationTitle',
      );

  static String get continueRegistrationDescription => Intl.message(
        'Мы против фейков.',
        desc: 'Описание на экране продолжения регистрации',
        name: 'SignInI18n_continueRegistrationDescription',
      );

  static String get paymentNotReadyTitle => Intl.message(
        'Ничего\nстрашного',
        desc: 'Заголовок на экране отказа платежа',
        name: 'SignInI18n_paymentNotReadyTitle',
      );

  static String get paymentNotReadyDescription => Intl.message(
        'В меню есть несколько \nвариантов получения \nбесплатных свиданий',
        desc: 'Описание на экране продолжения регистрации',
        name: 'SignInI18n_paymentNotReadyDescription',
      );

  static String get continueRegistrationBtn => Intl.message(
        'Продолжить',
        desc: 'Кнопка на экране продолжения регистрации',
        name: 'SignInI18n_continueRegistrationBtn',
      );

  static String get enableGeoLocationTitle => Intl.message(
        'Включи\nгеолокацию',
        desc: 'Заголовок на экране включения геолокации',
        name: 'SignInI18n_enableGeoLocationTitle',
      );

  static String get enableGeoLocationDescription => Intl.message(
        'Это позволит искать для тебя\nкандидатов рядом',
        desc: 'Описание на экране включения геолокации',
        name: 'SignInI18n_enableGeoLocationDescription',
      );

  static String get enableGeoLocationBtn => Intl.message(
        'Включить геолокацию',
        desc: 'Кнопка на экране включения геолокации',
        name: 'SignInI18n_enableGeoLocationBtn',
      );

  static String get geoLocationDisabled => Intl.message(
        'Геолокация отключена',
        desc: 'geoLocationDisabled',
        name: 'SignInI18n_geoLocationDisabled',
      );

  static String get selectCity => Intl.message(
        'Указать город',
        desc: 'selectCity',
        name: 'SignInI18n_selectCity',
      );

  static String get selectCityTitle => Intl.message(
        'Выбор города',
        desc: 'selectCityTitle',
        name: 'SignInI18n_selectCityTitle',
      );

  static String get geoLocationDisabledTitle => Intl.message(
        'Укажи город\nв котором ты проживаешь',
        desc: 'geoLocationDisabled',
        name: 'SignInI18n_geoLocationDisabledTitle',
      );

  static String get geoLocationDisabledDescription => Intl.message(
        'Расчет расстояния до кандидата будет производиться от центра населенного пункта.',
        desc: 'geoLocationDisabled',
        name: 'SignInI18n_geoLocationDisabledDescription',
      );

  static String get appSettingsError => Intl.message(
        'Не удалось открыть настройки',
        desc: 'geoLocationDisabled',
        name: 'SignInI18n_appSettingsError',
      );

  /// Greeting page

  static String get greetingTitle => Intl.message(
        'Прежде чем\nпролистнуть',
        desc: 'Заголовок "преждечем пролистнуть"',
        name: 'SignInI18n_greetingTitle',
      );

  static String get greetingInfo => Intl.message(
        'Приветствуем!\n\nМы рады быть частью твоего\nпутешествия по знакомствам и\nотносимся к каждому с уважением,\nнезависимо от его расы, религии,\nнациональности, этнической\nпринадлежности, цвета кожи,\nспособностей, размера, пола, гендерной\nидентичности или сексуальной\nориентации.\n\nПрисоединяйся к нам и соблюдай\n`правила` для безопасности и\nинклюзивности.',
        desc: 'Информация пользователю о приложении, привествтиве, правила.',
        name: 'SignInI18n_greetingInfo',
      );

  static String get greetingFromJOJO => Intl.message(
        'С любовью, команда JOJO.',
        desc: 'Сообщение приветствия пользователю',
        name: 'SignInI18n_greetingFromJOJO',
      );

  static String get greetingAgreement => Intl.message(
        'Я согласен',
        desc: 'Кнопка пользователь дает согласия',
        name: 'SignInI18n_greetingAgreement',
      );

  /// lgbt

  static String get lgbtInfo => Intl.message(
        'Дорогие друзья, мы понимаем, что для\nLGBTQ+ сообщества важен\nфункционал, который позволит\nзнакомиться и чувствовать себя при\nэтом комфортно и безопасно. Работа\nнад данным функционалом ведется и\nон появится в ближайшее время.\n\nОставь заявку, и как только выйдет\nверсия приложения для вас, мы\nсообщим тебе.',
        desc:
            'Сообщение пользователю информирующие о том, что лгбт версия появиться скоро и если он хочет, то может оставить заявку на обратное уведомление',
        name: 'SignInI18n_lgbtInfo',
      );

  static String get buttonLgbtSendAppl => Intl.message(
        'Оставить заявку',
        desc: 'Кнопка оставить заявку',
        name: 'SignInI18n_buttonLgbtSendAppl',
      );
}

class AuthI18n {
  static String get signIn => Intl.message(
        'Sign In',
        desc: 'Sign In title',
        name: 'AuthI18n_signIn',
      );

  static String get login => Intl.message(
        'Login',
        desc: 'Login',
        name: 'AuthI18n_login',
      );

  static String get loginRequired => Intl.message(
        'Login required',
        desc: 'Login required',
        name: 'AuthI18n_loginRequired',
      );

  static String get password => Intl.message(
        'Password',
        desc: 'Password',
        name: 'AuthI18n_password',
      );

  static String get passwordRequired => Intl.message(
        'The password must not be empty',
        desc: 'Password validation message',
        name: 'AuthI18n_passwordRequired',
      );

  static String get userNotFound => Intl.message(
        'Incorrect username or password',
        desc: 'Incorrect username or password message',
        name: 'AuthI18n_userNotFound',
      );

  static String get minimumPassword => Intl.message(
        'Password must have at least 6 characters',
        desc: 'Password must have at least 6 characters',
        name: 'AuthI18n_minimumPassword',
      );

  static String get checkInternetConnection => Intl.message(
        'Check internet connection',
        desc: 'Check internet connection',
        name: 'AuthI18n_checkInternetConnection',
      );
}
