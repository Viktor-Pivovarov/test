import 'package:intl/intl.dart';

class ChatI18n {
  static String get title => Intl.message(
        'chat title',
        desc: 'Description for Chat title',
        name: 'ChatI18n_title',
      );

  static String get chatNotFound => Intl.message(
        'Chat not found',
        desc: 'Description for Chat not found',
        name: 'ChatI18n_chatNotFound',
      );

  static String get pairs => Intl.message(
        'Пары',
        desc: 'Пары',
        name: 'ChatI18n_pairs',
      );

  static String get searchingPairs => Intl.message(
        'Ищем новые пары для вас...',
        desc: 'Ищем новые пары для вас...',
        name: 'ChatI18n_searchingPairs',
      );

  static String get newPairs => Intl.message(
        'Новые пары',
        desc: 'Новые пары',
        name: 'ChatI18n_newPairs',
      );

  static String get block => Intl.message(
        'Блокировка',
        desc: 'Блокировка',
        name: 'ChatI18n_block',
      );

  static String get remove => Intl.message(
        'Удалить',
        desc: 'Удалить',
        name: 'ChatI18n_remove',
      );

  static String get emptyChatsTitle => Intl.message(
        'Чаты пока пусты',
        desc: 'Чаты пока пусты',
        name: 'ChatI18n_emptyChatsTitle',
      );

  static String get emptyChats => Intl.message(
        'Все взаимные симпатии и чаты будут\nотображаться здесь. Удачных свиданий',
        desc:
            'Все взаимные симпатии и чаты будут отображаться здесь. Удачных свиданий',
        name: 'ChatI18n_emptyChats',
      );

  static String get chats => Intl.message(
        'Чаты',
        desc: 'Чаты',
        name: 'ChatI18n_chats',
      );

  static String get startChatTitle => Intl.message(
        'Начните общение!',
        desc: 'Начните общение!',
        name: 'ChatI18n_startChatTitle',
      );

  static String get startChatDesc => Intl.message(
        'Для открытия чата нажми на аватарку кандидата',
        desc: 'Для открытия чата нажми на аватарку кандидата',
        name: 'ChatI18n_startChatDesc',
      );

  static String lastVisitRecently(String gender) => Intl.gender(
        gender,
        male: 'Был недавно',
        female: 'Была недавно',
        other: 'Было недавно',
        desc: 'Был недавно',
        name: 'ChatI18n_lastVisitRecently',
        args: [gender],
      );

  static String lastVisitYesterday(String gender) => Intl.gender(
        gender,
        male: 'Был вчера',
        female: 'Была вчера',
        other: 'Было вчера',
        desc: 'Был вчера',
        name: 'ChatI18n_lastVisitYesterday',
        args: [gender],
      );

  static String lastVisit(String gender, String date) => Intl.gender(
        gender,
        male: 'Был $date',
        female: 'Была $date',
        other: 'Было $date',
        desc: 'Был',
        args: [gender, date],
        name: 'ChatI18n_lastVisit',
      );

  static String get today => Intl.message(
        'Сегодня',
        desc: 'Сегодня',
        name: 'ChatI18n_today',
      );

  static String get yesterday => Intl.message(
        'Вчера',
        desc: 'Вчера',
        name: 'ChatI18n_yesterday',
      );

  static String get watchAllPairs => Intl.message(
        'Смотреть\nвсе пары',
        desc: 'Смотреть все пары',
        name: 'ChatI18n_watchAllPairs',
      );

  static String get allPairs => Intl.message(
        'Все пары',
        desc: 'Все пары',
        name: 'ChatI18n_allPairs',
      );

  static String get blocked => Intl.message(
        'Пользователь заблокировал тебя',
        desc: 'Пользователь заблокировал тебя',
        name: 'ChatI18n_blocked',
      );

  static String get deleteMessage => Intl.message(
        'Удалить у всех',
        desc: 'Удалить у всех',
        name: 'ChatI18n_deleteMessage',
      );
}
