import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class AllPendingChatsPage extends StatelessWidget {
  const AllPendingChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        title: Text(ChatI18n.allPairs),
        useColor: true,
      ),
      body: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          if (state.status.isFirstFetchingInProgress) {
            return const ChatLoadingPage();
          }

          return ListView.builder(
            padding: const EdgeInsets.all(Insets.l),
            itemCount: state.pendingChats.length,
            itemBuilder: (context, index) {
              final PendingChatDTO item = state.pendingChats.elementAt(index);

              return CandidateCard(
                avatar: NetworkImage(item.interlocutor.photo),
                age: CoreI18n.age(item.interlocutor.age),
                score: item.interlocutor.compatibility.value.toInt(),
                type: item.interlocutor.datingStatus.toCandidateCardType(),
                onPressed: () {
                  // onPressedOffer?.call(offer.id);
                },
                status: SelectionI18n.datingStatus(
                  item.interlocutor.datingStatus,
                ),
                name: item.interlocutor.firstName,
              );
            },
          );
        },
      ),
    );
  }
}
