// ignore_for_file: implementation_imports

import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_menu/src/_menu.dart';

@RoutePage(name: 'MenuRootRouter')
class MenuRootPage extends AutoRouter implements AutoRouteWrapper {
  const MenuRootPage({
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuInjection.sl<MenuCubit>(),
        ),
        BlocProvider(
          create: (context) => MenuInjection.sl<MenuStatisticsCubit>()..init(),
        ),
        BlocProvider(
          create: (context) => MenuInjection.sl<MenuAboutCubit>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => MenuInjection.sl<MenuTariffCubit>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => MenuInjection.sl<MenuAlgorithmCubit>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => MenuInjection.sl<MenuBlacklistCubit>(),
        ),
        BlocProvider(
          create: (context) => MenuInjection.sl<MenuNotificationCubit>(),
          lazy: false,
        ),
      ],
      child: this,
    );
  }
}
