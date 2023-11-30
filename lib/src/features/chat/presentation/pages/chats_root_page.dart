import 'package:flutter/widgets.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:xander9112/xander9112.dart';

@RoutePage(name: 'ChatsRootRouter')
class ChatsRootPage extends AutoRouter implements AutoRouteWrapper {
  const ChatsRootPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: ProfileInjection.sl<ProfileCubit>()),
        BlocProvider(create: (_) => ChatInjection.sl<ChatsCubit>()),
      ],
      child: this,
    );
  }
}
