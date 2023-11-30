// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';

class SignUpI18n {
  static String get title => Intl.message(
        'Регистрация',
        desc: 'Заголовок на экране регистрации',
        name: 'SignUpI18n_title',
      );

  static String get signUpWithFB => Intl.message(
        'Регистрация через Facebook',
        desc: 'Название кнопки регистрации Facebook',
        name: 'SignUpI18n_signUpWithFB',
      );

  static String get signUpWithApple => Intl.message(
        'Регистрация с Apple',
        desc: 'Название кнопки регистрации Apple',
        name: 'SignUpI18n_signUpWithApple',
      );

  static String get signUpWithGoogle => Intl.message(
        'Регистрация с Google',
        desc: 'Название кнопки регистрации Google',
        name: 'SignUpI18n_signUpWithGoogle',
      );

  static String get privacy => Intl.message(
        'By entering you agree to the `Terms of Use` & `Privacy Policy`',
        desc: 'Название кнопки регистрации Google',
        name: 'SignUpI18n_privacy',
      );

  static String get enableNotificationsTitle => Intl.message(
        'Всего 3 вида PUSH-уведомлений:',
        desc: 'Заголовок на экране включения нотификаций',
        name: 'SignUpI18n_enableNotificationsTitle',
      );

  static String enableNotificationsDescription1(Object choice) => Intl.select(
        choice,
        <Object, String>{
          true: '1. Девушка приглашает на свидание',
          false: '1. Мужчина приглашает на свидание',
        },
        desc: 'Описание на экране включения нотификаций',
        name: 'SignUpI18n_enableNotificationsDescription1',
        args: [choice],
      );

  static String get enableNotificationsDescription2 => Intl.message(
        '2. Новый ежедневный подбор',
        desc: 'Описание на экране включения нотификаций',
        name: 'SignUpI18n_enableNotificationsDescription2',
      );

  static String get enableNotificationsDescription3 => Intl.message(
        '3. Сообщение в чате',
        desc: 'Описание на экране включения нотификаций',
        name: 'SignUpI18n_enableNotificationsDescription3',
      );

  static String get enableNotificationsBtn => Intl.message(
        'Разрешить уведомления',
        desc: 'Кнопка на экране включения нотификаций',
        name: 'SignUpI18n_enableNotificationsBtn',
      );

  static String get helpBtn => Intl.message(
        'Помощь',
        desc: 'Help',
        name: 'SignUpI18n_helpBtn',
      );

  static String get confirmBtn => Intl.message(
        'Подтверждаю',
        desc: 'Кнопка подтверждаю',
        name: 'SignUpI18n_confirmBtn',
      );

  static String get botName => Intl.message(
        'JOJO',
        desc: 'Имя бота',
        name: 'SignUpI18n_botName',
      );

  /// Biometry

  static String get checkUserMessage => Intl.message(
        'Мне нужно убедиться что это действительно ты. Необходимо\nпройти верификацию по селфи.',
        desc:
            'Сообщение от бота пользователю о необходимости пройти верификацию',
        name: 'SignUpI18n_checkUserMessage',
      );

  static String get selfieMessage => Intl.message(
        'Селфи не добавляется\nв твой профиль',
        desc:
            'Сообщение от бота пользователю о том, что селфи не добавляется в профиль',
        name: 'SignUpI18n_selfieMessage',
      );

  static String get passVerificationBtn => Intl.message(
        'Пройти верификацию',
        desc: 'Кнопка пройти верификацию',
        name: 'SignUpI18n_passVerificationBtn',
      );

  static String get correctSelfiePoseMessage => Intl.message(
        'Необходимо максимально\nповторить эту позу.',
        desc:
            'Сообщение от бота пользователю о том, что необходимо повторить позу с селфи',
        name: 'SignUpI18n_correctSelfiePoseMessage',
      );

  static String get takeSelfieBtn => Intl.message(
        'Сделать селфи',
        desc: 'Кнопка сделать селфи',
        name: 'SignUpI18n_takeSelfieBtn',
      );

  static String get poseMatchingCheckMessage => Intl.message(
        'Убедись, что твоя поза максимально повторяет позу оригинального\nфото. Не страшно если поза\nполучилась зеркальной.',
        desc:
            'Сообщение от бота пользователю о том, что поза должна соответствовать тестовому образцу',
        name: 'SignUpI18n_poseMatchingCheckMessage',
      );

  static String get retakePhotoBtn => Intl.message(
        'Переснять фото',
        desc: 'Кнопка переснять фото',
        name: 'SignUpI18n_retakePhotoBtn',
      );

  static String get submitPhotoReviewBtn => Intl.message(
        'Отправить на проверку',
        desc: 'Кнопка отправить на проверку',
        name: 'SignUpI18n_submitPhotoReviewBtn',
      );

  static String get submitPhotoReviewEditModeMessage => Intl.message(
        'Отправить фото на проверку',
        desc:
            'Сообщение пользователю, показывающие, что фото отправлено на проверку',
        name: 'SignUpI18n_submitPhotoReviewEditModeMessage',
      );

  /// BirthdayDate

  static String get dateBirthMessage => Intl.message(
        'Укажи свою дату рождения',
        desc:
            'Сообщение от бота пользователю о том, что необходимо указать дату рождения',
        name: 'SignUpI18n_dateBirthMessage',
      );

  static String get whatUsersSeeMessage => Intl.message(
        'Другие пользователи увидят\nтолько ваш возраст',
        desc:
            'Сообщение от бота пользователю о том, что увидят другие пользователи',
        name: 'SignUpI18n_whatUsersSeeMessage',
      );

  static String get dateBirthEditModeMessage => Intl.message(
        'Дата рождения:',
        desc: 'Сообщение пользователю, показывающие сохраненную дату рождения',
        name: 'SignUpI18n_dateBirthEditModeMessage',
      );

  /// BirthdayTime

  static String get birthdayTimeNight => Intl.message(
        'night',
        desc: 'ночь',
        name: 'SignUpI18n_birthdayTimeNight',
      );

  static String get birthdayTimeMorning => Intl.message(
        'morning',
        desc: 'утро',
        name: 'SignUpI18n_birthdayTimeMorning',
      );

  static String get birthdayTimeDay => Intl.message(
        'day',
        desc: 'день',
        name: 'SignUpI18n_birthdayTimeDay',
      );

  static String get birthdayTimeEvening => Intl.message(
        'evening',
        desc: 'вечер',
        name: 'SignUpI18n_birthdayTimeEvening',
      );

  static String get birthdayTimeDoNotKnow => Intl.message(
        'doNotKnow',
        desc: 'не знаю',
        name: 'SignUpI18n_birthdayTimeDoNotKnow',
      );

  static String get aboutAlgorithmMessage => Intl.message(
        'При подборе используется\nпрофессиональная астрология.\nДля этого мне нужно еще два параметра',
        desc:
            'Сообщение от бота пользователю о том, что используется для подбора пары',
        name: 'SignUpI18n_aboutAlgorithmMessage',
      );

  static String get aboutBirthdayTimeMessage => Intl.message(
        'Ты знаешь время своего рождения?',
        desc:
            'Сообщение от бота пользователю о том, знаешь ли ты время своего рождения',
        name: 'SignUpI18n_aboutBirthdayTimeMessage',
      );

  static String get yesBtn => Intl.message(
        'Да',
        desc: 'Кнопка да',
        name: 'SignUpI18n_yesBtn',
      );

  static String get noBtn => Intl.message(
        'Нет',
        desc: 'Кнопка нет',
        name: 'SignUpI18n_noBtn',
      );

  static String get birthdayTimeEditModeMessage => Intl.message(
        'Время Рождения:',
        desc: 'Сообщение пользователю, показывающие сохраненное время рождения',
        name: 'SignUpI18n_birthdayTimeEditModeMessage',
      );

  /// City

  static String get enterCityMessage => Intl.message(
        'Введи населенный пункт своего рождения.',
        desc:
            'Сообщение от бота пользователю о том, что требуется ввести населенный пункт своего рождения',
        name: 'SignUpI18n_enterCityMessage',
      );

  static String get cityFieldHint => Intl.message(
        'Найти город',
        desc: 'Подсказка найти город',
        name: 'SignUpI18n_cityFieldHint',
      );

  static String get placeBirthEditModeMessage => Intl.message(
        'Место рождения:',
        desc: 'Сообщение пользователю, показывающие сохраненное место рождения',
        name: 'SignUpI18n_placeBirthEditModeMessage',
      );

  /// Height

  static String get aboutHeightMessage => Intl.message(
        'Какой у тебя рост?',
        desc:
            'Сообщение от бота пользователю о том, что требуется ввести свой рост',
        name: 'SignUpI18n_aboutHeightMessage',
      );

  static String get centimetersLabel => Intl.message(
        'centimeters',
        desc: 'Лейбл сантиметры',
        name: 'SignUpI18n_centimetersLabel',
      );

  static String get myHeightEditModeMessage => Intl.message(
        'Мой Рост:',
        desc: 'Сообщение пользователю, показывающие сохраненный рост',
        name: 'SignUpI18n_myHeightEditModeMessage',
      );

  static String get cmEditModeMessage => Intl.message(
        'см.',
        desc: 'Сообщение пользователю, показывающие величину измерения роста',
        name: 'SignUpI18n_cmEditModeMessage',
      );

  /// Languages

  static String get aboutLanguagesMessage => Intl.message(
        'Укажи все языки, которыми ты владеешь. Это увеличит выборку кандидатов.',
        desc:
            'Сообщение от бота пользователю о том, что требуется указать языки, которыми владеет пользователь',
        name: 'SignUpI18n_aboutLanguagesMessage',
      );

  static String get showLanguagesBtn => Intl.message(
        'Показать все языки',
        desc: 'Кнопка показать языки',
        name: 'SignUpI18n_showLanguagesBtn',
      );

  static String get languagesEditModeMessage => Intl.message(
        'Владение языками:',
        desc: 'Сообщение пользователю, показывающие сохраненные языки',
        name: 'SignUpI18n_languagesEditModeMessage',
      );

  /// NameChoice

  static String get botHelloMessage => Intl.message(
        'Давай познакомимся поближе.\nКак тебя зовут? ',
        desc: 'Бот приветствует пользователя и спрашивает его имя',
        name: 'SignUpI18n_botHelloMessage',
      );

  static String botGreetingsMessage(String name) => Intl.message(
        '$name, приятно познакомиться. \nДавай заполним основные параметры твоей анкеты.',
        desc:
            'Бот говорит, что ему приятно познакомится и предлагает заполнить анкету',
        name: 'SignUpI18n_botGreetingsMessage',
        args: [name],
      );

  static String get enterNameFieldHint => Intl.message(
        'Введите ваше имя',
        desc:
            'Сообщение от бота пользователю о том, что требуется ввести свое имя',
        name: 'SignUpI18n_enterNameFieldHint',
      );

  static String get nameErrorMessage => Intl.message(
        'Имя может содержать только буквы.',
        desc:
            'Сообщение описывающие ошибку введенных данных, которые не соответствую шаблону',
        name: 'SignUpI18n_nameErrorMessage',
      );

  /// Photo

  static String get infoAboutHumanMessage => Intl.message(
        'Человек на 80% визуал, первое впечатление складывается по фотографиям.',
        desc:
            'Сообщение от бота пользователю о том, что люди чаще всего воспринимают информацию визуально',
        name: 'SignUpI18n_infoAboutHumanMessage',
      );

  static String get uploadPhotosMessage => Intl.message(
        'Загрузи минимум две свои фотографии хорошего качества.',
        desc:
            'Сообщение от бота пользователю о том, что требуется загрузить минимум 2 фотографии и что после можерации их можно заменить',
        name: 'SignUpI18n_uploadPhotosMessage',
      );

  static String get photoBtn => Intl.message(
        'Добавить фото',
        desc: 'photo',
        name: 'SignUpI18n_photoBtn',
      );

  /// SearchAge

  static String get userPreferenceMessage => Intl.message(
        'Теперь мне нужны твои\nпредпочтения по кандидатам',
        desc:
            'Сообщение от бота пользователю о том, что он хочет узнать об интересах пользователя',
        name: 'SignUpI18n_userPreferenceMessage',
      );

  static String get desiredAgeMessage => Intl.message(
        'Укажи его желаемый  возраст',
        desc:
            'Сообщение от бота пользователю о том, что требуется указать желаемый возраст кандидата',
        name: 'SignUpI18n_desiredAgeMessage',
      );

  static String get fromLabel => Intl.message(
        'От',
        desc: 'Лейбл предлог "от"',
        name: 'SignUpI18n_fromLabel',
      );

  static String get toLabel => Intl.message(
        'До',
        desc: 'Лейбл предлог "до"',
        name: 'SignUpI18n_toLabel',
      );

  static String get candidatesAgeEditModeMessage => Intl.message(
        'Возраст кандидатов:',
        desc:
            'Сообщение пользователю, показывающие сохраненный возраст кандидата',
        name: 'SignUpI18n_candidatesAgeEditModeMessage',
      );

  /// Welcome

  static String get timeCheckMessage => Intl.message(
        'Отлично. Мне нужно 5 минут на проверку данных и подбора первых кандидатов для тебя.',
        desc:
            'Сообщение от бота пользователю о том, что на проверку пользователя требуется время',
        name: 'SignUpI18n_timeCheckMessage',
      );

  static String get plusDateMessage => Intl.message(
        'Пока дополни свою анкету внутри приложения, это активирует все 17 параметров алгоритма. За 100% заполнение +1 свидание.',
        desc:
            'Сообщение от бота пользователю о том, что за заполненную анкету на 100% будет подарок свидание',
        name: 'SignUpI18n_plusDateMessage',
      );

  static String get welcomeNextBtn => Intl.message(
        'Далее',
        desc: 'Кнопка далее',
        name: 'SignUpI18n_welcomeNextBtn',
      );

  static String get permissionCameraTitle => Intl.message(
        'Открой доступ к камере',
        desc: 'Заголовок диалога с разрешением к камере',
        name: 'SignUpI18n_permissionCameraTitle',
      );

  static String get permissionCameraDescription => Intl.message(
        'Без проверки личности регистрация невозможна. Чтобы пройти верификацию, необходимо дать доступ к камере в настройках.',
        desc: 'Описание в диалоге с разрешением к камере',
        name: 'SignUpI18n_permissionCameraDescription',
      );

  static String get openSettingsBtn => Intl.message(
        'Открыть настройки',
        desc: 'Открыть настройки',
        name: 'SignUpI18n_openSettingsBtn',
      );

  static String get abortRegistrationBtn => Intl.message(
        'Прервать регистрацию',
        desc: 'Прервать регистрацию',
        name: 'SignUpI18n_abortRegistrationBtn',
      );

  static String get permissionPhotosTitle => Intl.message(
        'Открой доступ к медиатеке',
        desc: 'Заголовок диалога с разрешением к фото',
        name: 'SignUpI18n_permissionPhotosTitle',
      );

  static String get permissionPhotosDescription => Intl.message(
        'Без загрузки фотографий регистрация невозможна. Чтобы их загрузить, необходимо дать доступ в настройках телефона.',
        desc: 'Описание в диалоге с разрешением к фото',
        name: 'SignUpI18n_permissionPhotosDescription',
      );
}
