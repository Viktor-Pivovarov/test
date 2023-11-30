import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/main/_main.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

    ProfileInjection.sl<ProfileCubit>().init();
  }

  bool showBottomMenu(Map<String, dynamic>? data) {
    return data?['showBottomMenu'] == true;
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ProfileRootRouter(),
        LikedRootRouter(),
        SelectionRootRouter(),
        ChatsRootRouter(),
        MenuRootRouter(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        final meta = tabsRouter.current.router.topPage?.routeData.meta;
        return Scaffold(
          // appBar: AppBar(title: Text(context.router.currentPath)),
          body: UiScaffold(
            body: child,
            bottomNavigationBar: showBottomMenu(meta)
                ? BottomBar(
                    activeIndex: tabsRouter.activeIndex,
                    setActiveIndex: tabsRouter.setActiveIndex,
                  )
                : null,
          ),
        );
      },
    );
  }
}
