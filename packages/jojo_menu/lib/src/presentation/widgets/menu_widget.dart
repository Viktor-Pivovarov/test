import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    this.onPressedAboutApp,
    this.onPressedSupport,
    this.onPressedTariffs,
    this.onPressedFreeDates,
    this.onPressedStats,
    this.onPressedAlgorithm,
    this.onPressedSettings,
    this.onPressedActivateHints,
  });

  final VoidCallback? onPressedAboutApp;
  final VoidCallback? onPressedSupport;
  final VoidCallback? onPressedTariffs;
  final VoidCallback? onPressedFreeDates;
  final VoidCallback? onPressedStats;
  final VoidCallback? onPressedAlgorithm;
  final VoidCallback? onPressedSettings;
  final VoidCallback? onPressedActivateHints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MenuStatisticsCubit, MenuStatisticsState>(
          builder: (context, state) {
            if (state.datingInfoModel != null) {
              return MenuDateCard(
                title: MenuI18n.available,
                text: MenuI18n.dates,
                count: state.datingInfoModel?.balance ?? 0,
              );
            }
            return MenuDateCard(
              title: MenuI18n.available,
              text: MenuI18n.dates,
              isLoading: true,
            );
          },
        ),
        MenuTariffCard(
          title: MenuI18n.tariffs,
          text: MenuI18n.tariffsHint,
          onPressed: onPressedTariffs,
        ),
        const UiDivider(),
        MenuCard(
          title: MenuI18n.freeDates,
          text: MenuI18n.freeDatesHint,
          prefixIconAsset: Assets.icons.iGift,
          onPressed: onPressedFreeDates,
        ),
        MenuCard(
          title: MenuI18n.myStats,
          text: MenuI18n.myStatsHint,
          prefixIconAsset: Assets.icons.analyticsOutline,
          onPressed: onPressedStats,
        ),
        MenuCard(
          title: MenuI18n.algorithm,
          text: MenuI18n.algorithmHint,
          prefixIconAsset: Assets.icons.iMandala,
          onPressed: onPressedAlgorithm,
        ),
        UiProfileHintCard(
          label: MenuI18n.activateHints,
          text: MenuI18n.activateHintsDescription,
          onPressedButton: onPressedActivateHints,
        ),
        const UiDivider(),
        MenuCard(
          title: MenuI18n.supporting,
          text: MenuI18n.supportingHint,
          prefixIconAsset: Assets.icons.iQuestion,
          onPressed: onPressedSupport,
        ),
        MenuCard(
          title: MenuI18n.settings,
          text: MenuI18n.settingsHint,
          prefixIconAsset: Assets.icons.iSettings,
          onPressed: onPressedSettings,
        ),
        MenuAboutCard(
          onPressed: onPressedAboutApp,
        ),
      ],
    );
  }
}
