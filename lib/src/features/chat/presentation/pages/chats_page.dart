import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo/src/core/utils/_utils.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onResume: context.read<ChatsCubit>().checkNotifications,
    );
  }

  @override
  void dispose() {
    _listener.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if (state.status.isFirstFetchingInProgress) {
          return const ChatLoadingPage();
        }

        if (state.status.isFetchingFailure) {
          return UiRefreshScaffold(
            onRefresh: context.read<ChatsCubit>().init,
            useLayoutBuilder: true,
            child: Center(child: Text(state.error ?? '')),
          );
        }

        if (state.chats.isEmpty && state.pendingChats.isEmpty) {
          return UiRefreshScaffold(
            onRefresh: context.read<ChatsCubit>().init,
            useLayoutBuilder: true,
            child: const ChatPageEmpty(),
          );
        }

        return SafeArea(
          child: UiRefreshScaffold(
            backgroundColor: context.colors.bg.secondary,
            onRefresh: context.read<ChatsCubit>().init,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    minHeight: state.pendingChats.isNotEmpty
                        ? 256 // + MediaQuery.of(context).padding.top
                        : 72,
                    maxHeight: state.pendingChats.isNotEmpty
                        ? 256 // + MediaQuery.of(context).padding.top
                        : 72,
                    child: ColoredBox(
                      color: context.colors.bg.primary,
                      child: PendingChatItems(
                        items: state.pendingChats,
                        itemsCount: state.pendingChatsCount,
                        onPressedAllChats: () =>
                            context.router.pushNamed(ChatRoutePath.allChats),
                        onPressedChat: context.read<ChatsCubit>().onPressedChat,
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 56,
                    maxHeight: 56,
                    child: ColoredBox(
                      color: context.colors.bg.primary,
                      child: SizedBox(
                        width: context.mediaSize.width,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.colors.bg.secondary,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(Insets.l),
                              topRight: Radius.circular(Insets.l),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              Insets.l,
                              Insets.l,
                              Insets.l,
                              Insets.l,
                            ),
                            child: Text(
                              ChatI18n.chats,
                              style: context.texts.title.base
                                  .copyWith(color: context.colors.text.main),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    // top: Insets.l,
                    bottom: Insets.bottomNavBar,
                  ),
                  sliver: SliverFillRemaining(
                    hasScrollBody: false,
                    child: ActiveChatItems(
                      isNotificationEnabled: state.isNotificationEnabled,
                      items: [
                        ...state.chats,
                      ],
                      onPressedChat: context.read<ChatsCubit>().onPressedChat,
                      onPressedBlock: context.read<ChatsCubit>().onPressedBlock,
                      onPressedDelete:
                          context.read<ChatsCubit>().onPressedDelete,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
