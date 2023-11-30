import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuSettingsPage extends StatelessWidget {
  const MenuSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuInjection.sl<MenuSettingsCubit>(),
      child: Scaffold(
        appBar: UiAppBar(
          useColor: true,
          title: Text(
            MenuI18n.settings,
            style: context.text.mainTitleMedium,
          ),
        ),
        body: BlocBuilder<MenuSettingsCubit, MenuSettingsState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(
                left: Insets.l,
                right: Insets.l,
                top: Insets.l,
                bottom: Insets.bottomNavBar,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Builder(
                      builder: (context) {
                        final currentLocale = Localizations.localeOf(context);
                        return MenuCard(
                          title: MenuI18n.applicationLanguages,
                          text: AppSettingsI18n.languageType(
                            currentLocale.languageCode,
                          ),
                          prefixIconEmoji: AppSettingsI18n.languageFlag(
                            currentLocale.languageCode,
                          ),
                          onPressed: context
                              .read<MenuSettingsCubit>()
                              .onPressedLanguages,
                        );
                      },
                    ),
                    MenuCard(
                      title: MenuI18n.notifications,
                      text: MenuI18n.active,
                      prefixIconAsset: Assets.icons.iBell,
                      onPressed: context
                          .read<MenuSettingsCubit>()
                          .onPressedNotifications,
                    ),
                    const UiDivider(),
                    BlocBuilder<MenuBlacklistCubit, MenuBlacklistState>(
                      builder: (context, state) {
                        return MenuCard(
                          title: MenuI18n.blacklist,
                          text: MenuI18n.blacklistedPlural(
                            state.candidates.length,
                          ),
                          prefixIconAsset: Assets.icons.bxLock,
                          onPressed: context
                              .read<MenuSettingsCubit>()
                              .onPressedBlackList,
                        );
                      },
                    ),
                    const UiDivider(),
                    MenuCard(
                      title: MenuI18n.logout,
                      text: MenuI18n.comeBack,
                      prefixIconAsset: Assets.icons.iLogOut,
                      onPressed:
                          context.read<MenuSettingsCubit>().onPressedLogout,
                    ),
                    MenuCard(
                      title: MenuI18n.freezeAccount,
                      text: MenuI18n.freezeAccountDescription,
                      prefixIconAsset: Assets.icons.ionSnow,
                      onPressed: context
                          .read<MenuSettingsCubit>()
                          .onPressedFreezeAccount,
                    ),
                    MenuCard(
                      title: MenuI18n.deleteAccount,
                      text: MenuI18n.deleteAccountDescription,
                      prefixIconAsset: Assets.icons.iCross,
                      prefixIconColor: context.color.mainAccentColor,
                      onPressed: context
                          .read<MenuSettingsCubit>()
                          .onPressedDeleteAccount,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
