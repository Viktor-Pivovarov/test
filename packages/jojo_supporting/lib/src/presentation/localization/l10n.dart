import 'package:intl/intl.dart';

class SupportingI18n {
  static String get title => Intl.message(
        'Поддержка',
        desc: 'Description for Supporting title',
        name: 'SupportingI18n_title',
      );

  static String get supportingNotFound => Intl.message(
        'Supporting not found',
        desc: 'Description for Supporting not found',
        name: 'SupportingI18n_supportingNotFound',
      );

  static String get sendMessage => Intl.message(
        'Отправить сообщение',
        desc: 'Send message',
        name: 'SupportingI18n_sendMessage',
      );

  static String get yourEmail => Intl.message(
        'Ваш Email',
        desc: 'Your email',
        name: 'SupportingI18n_yourEmail',
      );

  static String get describeIssueHint => Intl.message(
        'Опишите возникшую проблему. Мы ответим вам на email',
        desc:
            'Describe the problem you are having. We will answer you by email',
        name: 'SupportingI18n_describeIssueHint',
      );

  static String get defaultError => Intl.message(
        'Ошибка. Проверьте интернет соединение',
        desc: 'Error. Check internet connection',
        name: 'SupportingI18n_defaultError',
      );
}
