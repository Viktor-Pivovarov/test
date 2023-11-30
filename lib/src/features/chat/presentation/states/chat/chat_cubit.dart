import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

part 'chat_cubit.freezed.dart';
part 'chat_cubit.g.dart';
part 'chat_state.dart';

class ChatCubit extends BaseCubit<ChatState> {
  ChatCubit({
    required ChatRepository repository,
    required EventBus eventBus,
  })  : _repository = repository,
        _eventBus = eventBus,
        super(const ChatState.initial());

  final ChatRepository _repository;

  final EventBus _eventBus;

  final FormControl<String> inputField = FormControl<String>(
    validators: [
      Validators.required,
    ],
  );

  Future<void> init(String id) async {
    await getChat(id);
  }

  Future<void> checkNotifications() async {
    final PermissionStatus statusNotification =
        await Permission.notification.request();

    emit(
      state.copyWith(
        isNotificationEnabled: statusNotification == PermissionStatus.granted,
      ),
    );
  }

  Future<void> getChat(String id) async {
    if (state.status.isPure) {
      emit(state.copyWith(status: StateStatus.firstFetchingInProgress));
    } else {
      emit(state.copyWith(status: StateStatus.fetchingInProgress));
    }

    final result = await _repository.getChat(id);

    result.fold((error) {
      emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: error.message,
        ),
      );
    }, (response) {
      emit(
        state.copyWith(
          chat: response.copyWith(
            messages: [...response.messages]..sort((a, b) {
                return b.createdAt.compareTo(a.createdAt);
              }),
          ),
          status: StateStatus.fetchingSuccess,
        ),
      );
    });
  }

  void onPressedProfile() {}

  Future<void> deleteMessage(String id) async {
    emit(
      state.copyWith(
        chat: state.chat?.copyWith(
          messages:
              state.chat?.messages.whereNot((e) => e.id == id).toList() ?? [],
        ),
      ),
    );

    _eventBus.fire(state.chat);
  }

  Future<void> onPressedSendMessage(String? value) async {
    if (value != null) {
      inputField.value = null;

      final _tempId = _addMessage(value);

      final result = await _repository.sendMessage(state.chat!.id, value);

      await result.fold((l) {
        _updateMessage(
          _tempId,
          state.chat!.messages
              .firstWhere((element) => element.id == _tempId)
              .copyWith(status: MessageStatus.error),
        );
      }, (r) async {
        await Future<void>.delayed(const Duration(seconds: 1));

        _eventBus.fire(state.chat!.copyWith(lastMessage: r.message));

        _updateMessage(
          _tempId,
          r.message,
        );
      });
    }
  }

  String _addMessage(String value) {
    final String id = const Uuid().v1();

    emit(
      state.copyWith(
        chat: state.chat?.copyWith(
          messages: [
            ChatMessageDTO(
              id: id,
              sender: MessageSender.me,
              type: MessageType.text,
              createdAt: DateTime.now(),
              message: value,
            ),
            ...state.chat!.messages,
          ],
        ),
      ),
    );

    return id;
  }

  void _updateMessage(String id, ChatMessageDTO value) {
    emit(
      state.copyWith(
        chat: state.chat?.copyWith(
          messages: state.chat!.messages.map((e) {
            if (e.id == id) {
              return value;
            }

            return e;
          }).toList(),
        ),
      ),
    );
  }

  Future<void> onPressedToggleMute() async {
    final bool isMuted = state.chat!.isMuted;

    emit(state.copyWith(chat: state.chat?.copyWith(isMuted: !isMuted)));

    if (!isMuted) {
      await _muteChat();
    } else {
      await _unMuteChat();
    }
  }

  Future<void> _muteChat() async {
    final result = await _repository.chatNotificationDecline(state.chat!.id);

    result.fold(
      (l) {
        emit(
          state.copyWith(
            chat: state.chat?.copyWith(isMuted: !state.chat!.isMuted),
          ),
        );
      },
      (r) => null,
    );
  }

  Future<void> _unMuteChat() async {
    final result = await _repository.chatNotificationAccept(state.chat!.id);

    result.fold(
      (l) {
        emit(
          state.copyWith(
            chat: state.chat?.copyWith(isMuted: !state.chat!.isMuted),
          ),
        );
      },
      (r) => null,
    );
  }

  Future<void> onPressedBlock() async {}
}
