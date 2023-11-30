import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:permission_handler/permission_handler.dart';

part 'chats_cubit.freezed.dart';
part 'chats_cubit.g.dart';
part 'chats_state.dart';

class ChatsCubit extends BaseCubit<ChatsState> {
  ChatsCubit({
    required ChatRepository repository,
    required ChatRouter router,
    required AppMetrics appMetrics,
    required EventBus eventBus,
  })  : _repository = repository,
        _router = router,
        _appMetrics = appMetrics,
        _eventBus = eventBus,
        super(const ChatsState.initial()) {
    init();
  }

  final AppMetrics _appMetrics;
  final ChatRepository _repository;
  final ChatRouter _router;
  final EventBus _eventBus;

  StreamSubscription<ChatDTO>? _streamSubscription;

  Future<void> init() async {
    await checkNotifications();

    await getChats();

    await _appMetrics.sendEvent(
      AppMetricsEvent.screenOpen,
      params: {
        'screen_name': 'all_chats_screen',
        'chats_open': state.chats.length,
        'status': state.pendingChats.length,
        'matches': state.pendingChats.map((e) => e.id),
      },
    );

    _streamSubscription = _eventBus.on<ChatDTO>().listen((event) {
      final bool hasChat =
          state.chats.firstWhereOrNull((element) => element.id == event.id) !=
              null;
      print('hasChat: $hasChat');
      if (!hasChat) {
        emit(
          state.copyWith(
            chats: [event, ...state.chats],
            pendingChats: state.pendingChats
                .whereNot((element) => element.id == event.id)
                .toList(),
          ),
        );

        return;
      }

      final List<ChatDTO> chats = [...state.chats].map((e) {
        if (e.id == event.id) {
          return event;
        }

        return e;
      }).toList()
        ..sort(
          (a, b) {
            if (a.lastMessage?.createdAt == null ||
                b.lastMessage?.createdAt == null) {
              return 0;
            }

            return b.lastMessage!.createdAt.compareTo(a.lastMessage!.createdAt);
          },
        );

      emit(state.copyWith(chats: chats));
    });
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

  Future<void> getChats() async {
    if (state.status.isPure) {
      emit(state.copyWith(status: StateStatus.firstFetchingInProgress));
    } else {
      emit(state.copyWith(status: StateStatus.fetchingInProgress));
    }

    final chatsResult = await _repository.getChats();
    final pendingChatsResult = await _repository.getChatsPending();

    chatsResult.fold((error) {
      emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: error.getLocalizedString(),
        ),
      );
    }, (response) {
      emit(
        state.copyWith(
          chats: response.items,
        ),
      );
    });

    pendingChatsResult.fold((error) {
      emit(
        state.copyWith(
          status: StateStatus.fetchingFailure,
          error: error.getLocalizedString(),
        ),
      );
    }, (response) {
      emit(
        state.copyWith(
          pendingChats: response.items,
          pendingChatsCount: response.count,
        ),
      );
    });

    emit(state.copyWith(status: StateStatus.fetchingSuccess));
  }

  void onPressedChat(String id) {
    _router.goToChat(id);
  }

  Future<bool> onPressedBlock(String id) async {
    bool isDeleted = false;

    final result = await _repository.blockChat(id);

    result.fold((error) {
      GetIt.I<NotifyService>().showError(
        error.message ?? error.getLocalizedString(),
      );
    }, (r) {
      emit(
        state.copyWith(
          chats: state.chats.whereNot((element) => element.id == id).toList(),
        ),
      );

      isDeleted = true;
    });

    return isDeleted;
  }

  Future<bool> onPressedDelete(String id) async {
    bool isDeleted = false;

    final result = await _repository.deleteChat(id);

    result.fold((error) {
      GetIt.I<NotifyService>().showError(
        error.message ?? error.getLocalizedString(),
      );
    }, (r) {
      emit(
        state.copyWith(
          chats: state.chats.whereNot((element) => element.id == id).toList(),
        ),
      );

      isDeleted = true;
    });

    return isDeleted;
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    await super.close();
  }
}
