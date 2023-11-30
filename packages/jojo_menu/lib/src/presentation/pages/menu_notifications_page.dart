import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class TestClass {
  TestClass({required this.value});

  final bool value;
}

@RoutePage()
class MenuNotificationsPage extends StatefulWidget {
  const MenuNotificationsPage({super.key});

  @override
  State<MenuNotificationsPage> createState() => _MenuNotificationsPageState();
}

class _MenuNotificationsPageState extends State<MenuNotificationsPage> {
  @override
  void initState() {
    super.initState();
    context.read<MenuNotificationCubit>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuNotificationCubit, MenuNotificationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: UiAppBar(
            useColor: true,
            title: Text(
              MenuI18n.notifications,
              style: context.text.mainTitle,
            ),
          ),
          body: state.form == null
              ? Center(
                  child: UiCircleProgressIndicator(
                    color: context.color.mainAccentColor,
                    width: Insets.xxxxl,
                    height: Insets.xxxxl,
                  ),
                )
              : ReactiveForm(
                  formGroup: state.form!,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Insets.l,
                      right: Insets.l,
                      top: Insets.xxl,
                      bottom: Insets.bottomNavBar,
                    ),
                    child: Column(
                      children: [
                        Builder(
                          builder: (context) {
                            if (state.status.isFetchingInProgress ||
                                state.status.isFetchingFailure) {
                              return const Center(
                                child: UiCircleProgressIndicator(),
                              );
                            }

                            return Column(
                              children: [
                                UiCard(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: Insets.xs,
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: Insets.m,
                                    bottom: Insets.s,
                                    left: Insets.l,
                                    right: Insets.l,
                                  ),
                                  titleWidget: Row(
                                    children: [
                                      Text(
                                        MenuI18n.newSelection,
                                        style: context.text.smallTitle,
                                      ),
                                      const Expanded(child: SizedBox.shrink()),
                                      UiSwitchField(
                                        onTap: context
                                            .read<MenuNotificationCubit>()
                                            .onTapNewSelection,
                                        formControl: state.form!.controls[
                                                MenuNotificationState
                                                    .newSelectionFormKey]!
                                            as FormControl<bool>,
                                      ),
                                    ],
                                  ),
                                ),
                                UiCard(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: Insets.xs,
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: Insets.m,
                                    bottom: Insets.s,
                                    left: Insets.l,
                                    right: Insets.l,
                                  ),
                                  titleWidget: Row(
                                    children: [
                                      Text(
                                        MenuI18n.mutualSympathyNotification,
                                        style: context.text.smallTitle,
                                      ),
                                      const Expanded(child: SizedBox.shrink()),
                                      UiSwitchField(
                                        onTap: context
                                            .read<MenuNotificationCubit>()
                                            .onTapMutualSympathy,
                                        formControl: state.form!.controls[
                                                MenuNotificationState
                                                    .mutualSympathy]!
                                            as FormControl<bool>,
                                      ),
                                    ],
                                  ),
                                ),
                                UiCard(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: Insets.xs,
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: Insets.m,
                                    bottom: Insets.s,
                                    left: Insets.l,
                                    right: Insets.l,
                                  ),
                                  titleWidget: Row(
                                    children: [
                                      Text(
                                        MenuI18n.chatMessages,
                                        style: context.text.smallTitle,
                                      ),
                                      const Expanded(child: SizedBox.shrink()),
                                      UiSwitchField(
                                        onTap: context
                                            .read<MenuNotificationCubit>()
                                            .onTapChat,
                                        formControl: state.form!.controls[
                                                MenuNotificationState.chat]!
                                            as FormControl<bool>,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
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
