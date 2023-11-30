import 'package:intl/intl.dart';

class AppSettingsI18n {
  static String get title => Intl.message(
        'Настройки',
        desc: 'Settings page',
        name: 'AppSettingsI18n_title',
      );

  static String get notifications => Intl.message(
        'Уведомления',
        desc: 'notifications',
        name: 'AppSettingsI18n_notifications',
      );

  static String get notificationPosts => Intl.message(
        'Посты',
        desc: 'notificationPosts',
        name: 'AppSettingsI18n_notificationPosts',
      );

  static String get notificationBirthday => Intl.message(
        'Дни рождения',
        desc: 'notificationBirthday',
        name: 'AppSettingsI18n_notificationBirthday',
      );

  static String get theme => Intl.message(
        'Theme',
        desc: 'Theme',
        name: 'AppSettingsI18n_theme',
      );

  static String get lightTheme => Intl.message(
        'Light',
        desc: 'Light theme',
        name: 'AppSettingsI18n_lightTheme',
      );

  static String get darkTheme => Intl.message(
        'Dark',
        desc: 'Dark theme',
        name: 'AppSettingsI18n_darkTheme',
      );

  static String get systemTheme => Intl.message(
        'System',
        desc: 'System theme',
        name: 'AppSettingsI18n_systemTheme',
      );

  static String get selectTheme => Intl.message(
        'Select a theme',
        desc: 'Select a theme',
        name: 'AppSettingsI18n_selectTheme',
      );

  static String get selectLanguage => Intl.message(
        'Select language',
        desc: 'Select language',
        name: 'AppSettingsI18n_selectLanguage',
      );

  static String get language => Intl.message(
        'Language',
        desc: 'Language',
        name: 'AppSettingsI18n_language',
      );

  static String languageType(String value) => Intl.select(
        value,
        {
          'ru': 'Русский',
          'en': 'English',
          'it': 'Italiano',
          'de': 'Deutsch',
          'fr': 'Français',
          'es': 'Español',
        },
        args: [value],
        desc: 'Language type',
        name: 'AppSettingsI18n_languageType',
      );

  static String languageFlag(String value) => Intl.select(
        value,
        {
          'ru': '🇷🇺',
          'en': '🇬🇧',
          'it': '🇮🇹',
          'de': '🇩🇪',
          'fr': '🇫🇷',
          'es': '🇪🇸',
        },
        args: [value],
        desc: 'Language type',
        name: 'AppSettingsI18n_languageType',
      );

  static String get systemLanguage => Intl.message(
        'System language',
        desc: 'System language',
        name: 'AppSettingsI18n_systemLanguage',
      );

  static String get security => Intl.message(
        'Безопасность',
        desc: 'security',
        name: 'AppSettingsI18n_security',
      );

  static String get changePinCode => Intl.message(
        'Change pin code',
        desc: 'Change pin code',
        name: 'AppSettingsI18n_changePinCode',
      );

  static String get useBiometrics => Intl.message(
        'Биометрия',
        desc: 'Use biometrics?',
        name: 'AppSettingsI18n_useBiometrics',
      );
  static String get useLocalAuth => Intl.message(
        'Use local auth?',
        desc: 'Use local auth?',
        name: 'AppSettingsI18n_useLocalAuth',
      );
  static String get updateTitle => Intl.message(
        'New version is available',
        desc: 'New version is available',
        name: 'AppSettingsI18n_updateTitle',
      );

  static String get updateBtn => Intl.message(
        'Update',
        desc: 'Update button',
        name: 'AppSettingsI18n_updateBtn',
      );

  static String get services => Intl.message(
        'Сервисы на главной',
        desc: 'services',
        name: 'AppSettingsI18n_services',
      );

  static String get servicesSettings => Intl.message(
        'Настройка сервисов',
        desc: 'servicesSettings',
        name: 'AppSettingsI18n_servicesSettings',
      );

  static String updateText(bool isRequired) => Intl.select(
        isRequired,
        <Object, String>{
          true: 'Update is required',
          false: 'We recommend update the app',
        },
        desc: 'New version is available',
        name: 'AppSettingsI18n_updateText',
        args: [isRequired],
      );
}
