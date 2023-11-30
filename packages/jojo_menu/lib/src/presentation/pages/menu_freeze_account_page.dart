import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_menu/jojo_menu.dart';

@RoutePage()
class MenuFreezeAccountPage extends StatelessWidget {
  const MenuFreezeAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuInjection.sl<MenuFreezeAccountCubit>(),
      child: BlocBuilder<MenuFreezeAccountCubit, MenuFreezeAccountState>(
        builder: (context, state) {
          if (!state.isFreezed) {
            return FreezeAccountWidget(
              onPressed: context.read<MenuFreezeAccountCubit>().onPressedFreeze,
            );
          } else {
            return UnFreezeAccountWidget(
              onPressed:
                  context.read<MenuFreezeAccountCubit>().onPressedUnfreeze,
            );
          }
        },
      ),
    );
  }
}
