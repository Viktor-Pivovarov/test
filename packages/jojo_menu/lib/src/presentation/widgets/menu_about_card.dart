import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class MenuAboutCard extends StatelessWidget {
  const MenuAboutCard({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuAboutCubit, MenuAboutState>(
      builder: (context, state) {
        return MenuCard(
          title: MenuI18n.aboutJojo,
          text: MenuI18n.appVersion(state.appInfo?.version ?? ''),
          prefixIconAsset: Assets.icons.iLogo,
          prefixIconColor: ThemeConfig.mainAccentColor,
          onPressed: onPressed,
        );
      },
    );
  }
}
