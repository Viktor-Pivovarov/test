import 'dart:math';

import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo/src/features/selection/_selection.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );

final items = [
  ChatDTO(
    id: '1',
    isOnline: true,
    lastMessage: ChatMessageDTO(
      id: '1',
      sender: MessageSender.interlocutor,
      type: MessageType.text,
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      message: 'Что нового?',
      status: MessageStatus.delivered,
    ),
    interlocutor: const ChatInterlocutorDTO(
      photo:
          'https://cdn.discordapp.com/attachments/1136644635645710478/1139662502477701260/uxbrain_The_girl_in_your_dreams_c8dc5060-d21a-43c8-937e-ca84f7060163.png',
      firstName: 'Юлия',
      // gender: Gender.female,
    ),
    unreadCount: 12,
    messages: [
      ChatMessageDTO(
        id: '100500',
        sender: MessageSender.assistant,
        type: MessageType.text,
        createdAt: DateTime.now(),
        message:
            'Привет Alex! Сори) Я решил немного похулиганить и начал диалог с девушкой за тебя. Я частенько это делаю, если между парой не начинается диалог в течении 24 часов после взаимной симпатии. Удачи и хорошего дня ☀️',
        status: MessageStatus.delivered,
      ),
      ...List.generate(30, (index) {
        return ChatMessageDTO(
          id: '$index',
          sender: index.isEven ? MessageSender.interlocutor : MessageSender.me,
          type: MessageType.text,
          createdAt: DateTime.now().subtract(
            index < 10
                ? Duration(minutes: index + 1)
                : index < 20
                    ? const Duration(days: 1)
                    : Duration(days: index),
          ),
          message: List.generate(
            Random().nextInt(10),
            (index) => getRandomString(10),
          ).join(' '),
          // status: index > 15 ? MessageStatus.delivered : MessageStatus.sended,
          status: MessageStatus.delivered,
        );
      }),
    ],

    // [
    //   ChatMessageDTO(
    //     id: '6',
    //     sender: MessageSender.candidate,
    //     type: MessageType.text,
    //     createdAt:
    //         DateTime.now().subtract(const Duration(days: 1, minutes: 14)),
    //     message: 'Привет! Как дела?',
    //     status: MessageStatus.delivered,
    //   ),
    //   ChatMessageDTO(
    //     id: '5',
    //     sender: MessageSender.candidate,
    //     type: MessageType.text,
    //     createdAt:
    //         DateTime.now().subtract(const Duration(days: 1, minutes: 12)),
    //     message:
    //         'Какой-то еще длинный текст который кандидат пишет пользователю и который умещается в несколько строк',
    //     status: MessageStatus.delivered,
    //   ),
    //   ChatMessageDTO(
    //     id: '4',
    //     sender: MessageSender.candidate,
    //     type: MessageType.text,
    //     createdAt: DateTime.now().subtract(const Duration(minutes: 12)),
    //     message: 'Привет! Как дела?',
    //     status: MessageStatus.delivered,
    //   ),
    //   ChatMessageDTO(
    //     id: '3',
    //     sender: MessageSender.me,
    //     type: MessageType.text,
    //     createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
    //     message: 'Привет! Хорошо!',
    //     status: MessageStatus.delivered,
    //   ),
    //   ChatMessageDTO(
    //     id: '2',
    //     sender: MessageSender.me,
    //     type: MessageType.text,
    //     createdAt: DateTime.now().subtract(const Duration(minutes: 9)),
    //     message:
    //         'Какой-то еще длинный текст который юзер пишет кандидату и который умещается в несколько строк',
    //     status: MessageStatus.delivered,
    //   ),
    //   ChatMessageDTO(
    //     id: '1',
    //     sender: MessageSender.candidate,
    //     type: MessageType.text,
    //     createdAt: DateTime.now().subtract(const Duration(minutes: 8)),
    //     message: 'Что нового?',
    //     status: MessageStatus.delivered,
    //   ),
    // ],
    // lastVisit: DateTime.now().subtract(const Duration(hours: 49)),
    // lastMessage: ChatMessageDTO(
    //   id: 1,
    //   status: MessageStatus.delivered,
    //   sender: MessageSender.me,
    //   type: MessageType.text,
    //   date: DateTime.now().subtract(const Duration(minutes: 20)),
    //   message:
    //       'Lorem ipsum dolor sit amet, consecte. Lorem ipsum dolor sit amet, consecte. Lorem ipsum dolor sit amet, consecte',
    // ),
  ),
  ChatDTO(
    id: '2',
    interlocutor: const ChatInterlocutorDTO(
      photo:
          'https://cdn.discordapp.com/attachments/1136644635645710478/1138017623989301279/uxbrain_a_young_white_european_smiling_male_person_in_full-leng_ede9473e-d880-4221-8719-a2e73a93ea61.png',
      firstName: 'Александр',
      // gender: Gender.male,
    ),
    lastVisit: DateTime.now().subtract(const Duration(hours: 49)),
    isMuted: true,
    lastMessage: ChatMessageDTO(
      id: '1',
      sender: MessageSender.interlocutor,
      type: MessageType.text,
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      message: 'Что нового?',
      status: MessageStatus.delivered,
    ),
  ),
  ChatDTO(
    id: '3',
    interlocutor: const ChatInterlocutorDTO(
      photo:
          'https://img.freepik.com/free-photo/the-beautiful-girl-stands-near-walll-with-leaves_8353-5377.jpg',
      firstName: 'Ангелина',
      // gender: Gender.female,
    ),
    unreadCount: 1,
    isMuted: true,
    lastMessage: ChatMessageDTO(
      id: '1',
      sender: MessageSender.interlocutor,
      type: MessageType.text,
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      message: 'Что нового?',
      status: MessageStatus.delivered,
    ),
  ),
];

class MockChatDataSource implements ChatDataSource {
  @override
  Future<void> blockChat(String id) {
    return Future<void>.delayed(const Duration(seconds: 2));
  }

  @override
  Future<ChatDTO> getChat(String id) {
    return Future<ChatDTO>.delayed(const Duration(milliseconds: 50), () {
      return items.firstWhere((element) => element.id == id);
    });
  }

  @override
  Future<ResponseChatsDTO> getChats() {
    return Future<ResponseChatsDTO>.delayed(const Duration(milliseconds: 100),
        () {
      return ResponseChatsDTO(items: items, pagination: const PaginationDTO());
    });
  }

  @override
  Future<void> chatNotificationAccept(String id) {
    // TODO: implement chatNotificationAccept
    throw UnimplementedError();
  }

  @override
  Future<void> chatNotificationDecline(String id) {
    // TODO: implement chatNotificationDecline
    throw UnimplementedError();
  }

  @override
  Future<ResponsePendingChatsDTO> getChatsPending() async {
    return ResponsePendingChatsDTO(
      count: 100,
      pagination: const PaginationDTO(),
      items: List.generate(100, (index) {
        return const PendingChatDTO(
          id: '1',
          interlocutor: PendingChatInterlocutorDTO(
            photo:
                'https://cdn.discordapp.com/attachments/1136644635645710478/1139662502477701260/uxbrain_The_girl_in_your_dreams_c8dc5060-d21a-43c8-937e-ca84f7060163.png',
            firstName: 'firstName',
            age: 18,
            compatibility: OfferEntityCompatibility(maxValue: 36, value: 29),
          ),
        );
      }),
    );
  }

  @override
  Future<SendChatMessageResponseDTO> sendMessage(
    String id,
    String message,
  ) async {
    return SendChatMessageResponseDTO(
      message: ChatMessageDTO(
        id: '1232',
        sender: MessageSender.interlocutor,
        type: MessageType.text,
        createdAt: DateTime.now(),
      ),
    );
  }

  @override
  Future<void> deleteChat(String id) {
    // TODO: implement deleteChat
    throw UnimplementedError();
  }
}
