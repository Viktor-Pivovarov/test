import 'package:auto_route/auto_route.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/chat/_chat.dart';

List<AutoRoute> chatRoutes = [
  AutoRoute(
    page: ChatsRootRouter.page,
    path: ChatRoutePath.chat,
    meta: const {'showBottomMenu': true},
    children: [
      AutoRoute(
        page: ChatsRoute.page,
        path: '',
        initial: true,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: AllPendingChatsRoute.page,
        path: ChatRoutePath.allChats,
      ),
      AutoRoute(
        page: ChatRoute.page,
        path: ChatRoutePath.personChat,
      ),
    ],
  ),
];
