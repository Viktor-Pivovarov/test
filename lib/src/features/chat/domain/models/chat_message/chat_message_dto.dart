import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'chat_message_dto.freezed.dart';
part 'chat_message_dto.g.dart';

@freezed
class ChatMessageDTO with _$ChatMessageDTO {
  const factory ChatMessageDTO({
    required String id,
    required MessageSender sender,
    required MessageType type,
    required DateTime createdAt,
    @Default(MessageStatus.draft) MessageStatus status,
    dynamic message,
  }) = _ChatMessageDTO;

  factory ChatMessageDTO.fromJson(Object? json) =>
      _$ChatMessageDTOFromJson(json! as Map<String, dynamic>);

  const ChatMessageDTO._();

  @override
  Map<String, dynamic> toJson();

  String get time => DateHelper.formatToLocalTime(createdAt);

  bool get isMe => sender == MessageSender.me;

  bool get isInterlocutor => sender == MessageSender.interlocutor;

  bool get isBot => sender == MessageSender.bot;

  bool get isAssistant => sender == MessageSender.assistant;
}

enum MessageStatus {
  error,
  draft,
  sended,
  delivered,
  read;

  bool get isDraft => this == draft;
  bool get isSended => this == sended;
  bool get isDelivered => this == delivered;
}

enum MessageSender {
  bot,
  assistant,
  me,
  interlocutor;

  bool get isMe => this == MessageSender.me;

  bool get isInterlocutor => this == MessageSender.interlocutor;

  bool get isBot => this == MessageSender.bot;

  bool get isAssistant => this == MessageSender.assistant;
}

enum MessageType { text, audio, photo }
