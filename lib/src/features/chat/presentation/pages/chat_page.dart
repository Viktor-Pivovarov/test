import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo/src/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({
    @PathParam('id') required this.id,
    super.key,
  });

  final String id;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FocusNode _focusNode = FocusNode();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  bool showScrollToBottomButton = false;
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();

    _listener = AppLifecycleListener(
      onResume: context.read<ChatsCubit>().checkNotifications,
    );

    itemPositionsListener.itemPositions.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (itemPositionsListener.itemPositions.value.isEmpty) {
      return;
    }

    if (itemPositionsListener.itemPositions.value.first.index > 3 &&
        !showScrollToBottomButton) {
      setState(() {
        showScrollToBottomButton = true;
      });
    }

    if (itemPositionsListener.itemPositions.value.first.index < 3 &&
        showScrollToBottomButton) {
      setState(() {
        showScrollToBottomButton = false;
      });
    }
  }

  @override
  void dispose() {
    _listener.dispose();

    itemPositionsListener.itemPositions.removeListener(_scrollListener);

    super.dispose();
  }

  void _scrollToBottom() {
    itemScrollController.scrollTo(
      index: 0,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatInjection.sl<ChatCubit>()..init(widget.id),
      child: BlocConsumer<ChatCubit, ChatState>(
        listenWhen: (previous, current) {
          // final previousMessages = previous.chat?.messages ?? [];
          // final currentMessages = current.chat?.messages ?? [];

          return previous.chat == null && current.chat != null;

          // return previousMessages.isEmpty && currentMessages.isNotEmpty;
        },
        listener: (context, state) async {
          final index = state.chat!.messages.lastIndexWhere(
            (element) => element.status == MessageStatus.sended,
          );

          if (index == -1) {
            return;
          }

          Future.delayed(const Duration(milliseconds: 10), () {
            itemScrollController.jumpTo(
              alignment: 0.8,
              index: state.chat!.messages.lastIndexWhere(
                (element) => element.status == MessageStatus.sended,
              ),
            );
          });
        },
        builder: (context, state) {
          final ChatCubit cubit = context.read<ChatCubit>();

          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: UiAppBar(
              useColor: true,
              useShadow: true,
              title: UiChatAppBar(
                chat: state.chat,
                onPressedProfile: cubit.onPressedProfile,
                onPressedBlock: cubit.onPressedBlock,
                onPressedToggleMute: cubit.onPressedToggleMute,
              ),
              // bottom: UiAppBarNotification(
              //   onPressed: () {},
              //   type: AppBarNotificationType.success,
              // ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _focusNode.unfocus,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          ScrollablePositionedList.builder(
                            itemScrollController: itemScrollController,
                            itemPositionsListener: itemPositionsListener,
                            reverse: true,
                            padding: const EdgeInsets.all(Insets.l),
                            itemCount: state.chat?.messages.length ?? 0,
                            itemBuilder: (context, index) =>
                                itemBuilder(context, index, state),
                          ),
                          if (showScrollToBottomButton)
                            Positioned(
                              right: Insets.l,
                              bottom: Insets.l,
                              child: UiBottomScrollButton(
                                onPressed: _scrollToBottom,
                              ),
                            ),
                          if (state.status.isFirstFetchingInProgress)
                            UiLoader(color: context.colors.content.brand),
                          if (state.status.isFetchingFailure)
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(Insets.l),
                                child: Text(
                                  'ERROR\n\n ${state.error}',
                                  textAlign: TextAlign.center,
                                  style: context.texts.body.bodyLight.copyWith(
                                    color: context.theme.colorScheme.error,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.chat != null)
                  SafeArea(
                    bottom: false,
                    child: UiSendField(
                      formControl: cubit.inputField,
                      onSubmit: cubit.onPressedSendMessage,
                      focusNode: _focusNode,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index, ChatState state) {
    final message = state.chat!.messages.elementAt(index);
    final nextMessage = state.chat!.messages.elementAtOrNull(index + 1);

    DateTime? date;

    if (nextMessage != null &&
        DateHelper.getDifferenceInDays(
              message.createdAt,
              nextMessage.createdAt,
            ) !=
            0) {
      date = message.createdAt;
    } else if (nextMessage == null) {
      date = message.createdAt;
    }

    return FocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width * 0.40,
      blurSize: 5,
      onPressed: () {},
      duration: const Duration(milliseconds: 100),
      animateMenuItems: true,
      blurBackgroundColor: context.colors.bg.darker.withOpacity(0.7),
      menuItems: <FocusedMenuItem>[
        FocusedMenuItem(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: Insets.xs),
                child: UiIcon(
                  AssetsNew.icons.dsTrash.path,
                  color: context.colors.text.link,
                ),
              ),
              Text(
                ChatI18n.deleteMessage,
                style: context.texts.footnote.baseSemibold.copyWith(
                  color: context.colors.text.link,
                ),
              ),
            ],
          ),
          onPressed: () {
            context.read<ChatCubit>().deleteMessage(message.id);
          },
        ),
      ],
      child: UiChatMessage(
        item: message,
        date: date,
      ),
    );
  }
}
