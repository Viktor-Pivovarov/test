import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuDeleteAccountPage extends StatelessWidget {
  const MenuDeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuInjection.sl<MenuDeleteAccountCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: UiAppBar(
              useColor: true,
              title: Text(
                MenuI18n.deleteAccount,
                style: context.text.mainTitle,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                left: Insets.l,
                right: Insets.l,
                top: Insets.xxl,
                bottom: Insets.bottomNavBar,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Insets.xxl),
                    child: Text(
                      MenuI18n.yourAccountWillBeDeleted,
                      textAlign: TextAlign.center,
                      style: context.text.bigTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Insets.m,
                      right: Insets.m,
                      top: Insets.l,
                    ),
                    child: Text(
                      MenuI18n.yourAccountWillBeDeletedDescription,
                      textAlign: TextAlign.center,
                      style: context.text.mainText
                          .copyWith(color: context.color.smallTextColor),
                    ),
                  ),
                  Expanded(
                    flex: 50,
                    child: UiImage(
                      Assets.images.failed,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                  UiButton(
                    text: MenuI18n.freezeAccountTitle,
                    onPressed: context
                        .read<MenuDeleteAccountCubit>()
                        .onPressedFreezeAccount,
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  UiButton.text(
                    text: MenuI18n.deleteAccount,
                    onPressed: context
                        .read<MenuDeleteAccountCubit>()
                        .onPressedDeleteAccount,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
