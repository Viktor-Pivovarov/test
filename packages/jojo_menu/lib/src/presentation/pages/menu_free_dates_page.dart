import 'package:flutter/material.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuFreeDatesPage extends StatelessWidget {
  const MenuFreeDatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuInjection.sl<MenuFreeDatesCubit>(),
      child: Scaffold(
        appBar: UiAppBar(
          useColor: true,
          title: Text(
            MenuI18n.freeDates,
            style: context.text.mainTitleMedium,
          ),
        ),
        body: BlocBuilder<MenuFreeDatesCubit, MenuFreeDatesState>(
          builder: (context, state) {
            if (state.status == StateStatus.fetchingInProgress ||
                state.status == StateStatus.fetchingFailure) {
              return Center(
                child: UiCircleProgressIndicator(
                  width: 100,
                  height: 100,
                  color: context.color.mainAccentColor,
                ),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Insets.l,
                  right: Insets.l,
                  top: Insets.xxl,
                  bottom: Insets.bottomNavBar,
                ),
                child: Column(
                  children: [
                    for (final task in state.unCompletedBonuses)
                      MenuFreeDateTaskCard(
                        index: state.unCompletedBonuses.indexOf(task) + 1,
                        title: getTitle(task.type),
                        content: getContent(task.type),
                        contentWidget: task.type == BonusType.giftDate
                            ? const _GiftWidgetContent()
                            : null,
                        btnText: getBtnLabel(task.type),
                        completed: task.completed,
                        label: MenuI18n.completed,
                        btnSuffixIcon: task.type == BonusType.giftDate
                            ? UiIcon(Assets.icons.share)
                            : null,
                        onPressed: task.enabled
                            ? () {
                                context
                                    .read<MenuFreeDatesCubit>()
                                    .onPressedTask(
                                      task,
                                      context,
                                    );
                              }
                            : null,
                      ),
                    for (final task in state.completedBonuses)
                      MenuFreeDateTaskCard(
                        index: state.completedBonuses.indexOf(task) + 1,
                        title: getTitle(task.type),
                        content: getContent(task.type),
                        contentWidget: task.type == BonusType.giftDate
                            ? const _GiftWidgetContent()
                            : null,
                        btnText: getBtnLabel(task.type),
                        completed: task.completed,
                        label: MenuI18n.completed,
                        btnSuffixIcon: task.type == BonusType.giftDate
                            ? UiIcon(Assets.icons.share)
                            : null,
                        onPressed: task.enabled
                            ? () {
                                context
                                    .read<MenuFreeDatesCubit>()
                                    .onPressedTask(
                                      task,
                                      context,
                                    );
                              }
                            : null,
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

  String getTitle(BonusType type) {
    switch (type) {
      case BonusType.completeProfile:
        return MenuI18n.completeProfile;
      case BonusType.review:
        return MenuI18n.review;
      case BonusType.giftDate:
        return MenuI18n.giftDate;
    }
  }

  String getContent(BonusType type) {
    switch (type) {
      case BonusType.completeProfile:
        return MenuI18n.completeProfileContent;
      case BonusType.review:
        return MenuI18n.reviewContent;
      case BonusType.giftDate:
        return '';
    }
  }

  String getBtnLabel(BonusType type) {
    switch (type) {
      case BonusType.completeProfile:
        return MenuI18n.completeProfileBtn;
      case BonusType.review:
        return MenuI18n.reviewBtn;
      case BonusType.giftDate:
        return MenuI18n.giftDateBtn;
    }
  }
}

class _GiftWidgetContent extends StatelessWidget {
  const _GiftWidgetContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          MenuI18n.giftDateContent,
          style: context.text.smallText,
        ),
        UiImage(Assets.images.giftMeet),
        Text(
          MenuI18n.giftDateContent2,
          style: context.text.smallText
              .copyWith(color: context.color.smallTextColor),
        ),
      ],
    );
  }
}
