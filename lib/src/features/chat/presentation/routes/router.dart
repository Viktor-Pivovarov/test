import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class ChatRouter extends AppRouter {
  ChatRouter(super.router);

  void goToChat(String id) {
    pushNamed(ChatRoutePath.personChat.routeParams({'id': id}));
  }

  void goToAllChats() {
    pushNamed(ChatRoutePath.allChats);
  }

  void goToPersonChat(int id) {
    pushNamed(ChatRoutePath.personChat.routeParams({'id': id}));
  }
}
