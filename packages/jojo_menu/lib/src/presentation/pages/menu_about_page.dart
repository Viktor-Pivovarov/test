import 'package:flutter/material.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuAboutPage extends StatefulWidget {
  const MenuAboutPage({super.key});

  @override
  State<MenuAboutPage> createState() => _MenuAboutPageState();
}

class _MenuAboutPageState extends State<MenuAboutPage> {
  @override
  void initState() {
    super.initState();
    context.read<MenuAboutCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuAboutCubit, MenuAboutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: UiAppBar(
            title: Text(
              MenuI18n.aboutJojo,
              style: context.text.mainTitleMedium,
            ),
            backgroundColor: Colors.white,
            useColor: true,
            useShadow: true,
            actions: [
              if (state.status == StateStatus.fetchingSuccess &&
                  state.appInfo != null)
                Padding(
                  padding: const EdgeInsets.only(top: Insets.xl),
                  child: Text(
                    MenuI18n.appVersion(state.appInfo?.version ?? ''),
                    style: context.text.smallText
                        .copyWith(color: context.color.smallTextColor),
                  ),
                ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: Insets.l,
                right: Insets.l,
                bottom: Insets.bottomNavBar,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiIcon(
                    Assets.icons.iLogo,
                    color: context.color.mainAccentColor,
                    width: Insets.xxl,
                    height: Insets.xxl,
                  ),
                  Text(MenuI18n.aboutJojo, style: context.text.mainTitleMedium),
                  Text(MenuI18n.aboutJojoExplain, style: context.text.mainText),
                  const SizedBox(height: Insets.xl),
                  MenuCard(
                    title: MenuI18n.termsOfUse,
                    onPressed:
                        context.read<MenuAboutCubit>().onPressedTermsOfUse,
                  ),
                  MenuCard(
                    title: MenuI18n.personalDataProcessing,
                    onPressed:
                        context.read<MenuAboutCubit>().onPressedPersonalData,
                  ),
                  MenuCard(
                    title: MenuI18n.privacyPolicy,
                    onPressed:
                        context.read<MenuAboutCubit>().onPressedPrivacyPolicy,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
