import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_menu/src/presentation/widgets/menu_widget.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Color appBarColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
  }

  void onScroll(double offset) {
    if (offset > 50) {
      if (appBarColor == Colors.white) {
        return;
      }

      setState(() {
        appBarColor = Colors.white.withOpacity(getDelta(offset.clamp(10, 50)));
      });
    } else {
      setState(() {
        appBarColor = Colors.white.withOpacity(getDelta(offset.clamp(10, 50)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        final cubit = context.read<MenuCubit>();
        return UiScrollScaffold(
          padding: const EdgeInsets.only(bottom: Insets.bottomNavBar),
          onScroll: onScroll,
          appBar: UiAppBar(
            backgroundColor: appBarColor,
            title: Text(
              MenuI18n.title,
              style: context.text.bigTitle,
            ),
            useColor: true,
          ),
          stateStream: cubit.refreshStream,
          onRefresh: cubit.onRefresh,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.l),
              child: MenuWidget(
                onPressedAboutApp: cubit.onPressedAbout,
                onPressedSupport: cubit.onPressedSupporting,
                onPressedActivateHints: cubit.onPressedActivateHints,
                onPressedAlgorithm: cubit.onPressedAlgorithm,
                onPressedFreeDates: cubit.onPressedFreeDates,
                onPressedSettings: cubit.onPressedSettings,
                onPressedStats: cubit.onPressedStatistics,
                onPressedTariffs: cubit.onPressedTariffs,
              ),
            ),
          ],
        );
      },
    );
  }
}
