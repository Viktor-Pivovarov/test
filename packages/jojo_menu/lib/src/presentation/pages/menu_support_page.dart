import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuSupportPage extends StatelessWidget {
  const MenuSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuInjection.sl<MenuSupportingCubit>()..init(),
      child: Scaffold(
        appBar: UiAppBar(
          title: Text(
            MenuI18n.supporting,
            style: context.text.mainTitleMedium,
          ),
          useShadow: true,
          useColor: true,
        ),
        body: BlocBuilder<MenuSupportingCubit, MenuSupportingState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: Insets.l,
                  left: Insets.l,
                  right: Insets.l,
                  bottom: Insets.bottomNavBar,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuSupportProblemCard(
                      title: MenuI18n.haveIssue,
                      label: MenuI18n.contactUs,
                      onPressed: () => context
                          .read<MenuSupportingCubit>()
                          .onSupportingPressed(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Insets.l),
                      child: Text(
                        MenuI18n.faq,
                        style: context.text.mainTextMedium
                            .copyWith(color: context.color.smallTextColor),
                      ),
                    ),
                    ...state.faq.items.map(
                      (e) => UiExpandableCard(
                        title: Text(
                          e.question,
                          style: context.text.smallTitleMedium,
                        ),
                        bodyBuilder: (context, isExpanded) {
                          if (isExpanded) {
                            return Text(
                              e.answer,
                              style: context.text.smallText.copyWith(
                                color: context.color.smallTextColor,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
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
