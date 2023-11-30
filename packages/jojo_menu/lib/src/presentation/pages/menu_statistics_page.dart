import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuStatisticsPage extends StatefulWidget {
  const MenuStatisticsPage({super.key});

  @override
  State<MenuStatisticsPage> createState() => _MenuStatisticsPageState();
}

class _MenuStatisticsPageState extends State<MenuStatisticsPage> {
  @override
  void initState() {
    super.initState();
    context.read<MenuStatisticsCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        useColor: true,
        title: Text(
          MenuI18n.statistics,
          style: context.text.mainTitleMedium,
        ),
      ),
      body: BlocBuilder<MenuStatisticsCubit, MenuStatisticsState>(
        builder: (context, state) {
          if (state.datingInfoModel != null) {
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
                    MenuDateCard(
                      title: MenuI18n.available,
                      text: MenuI18n.dates,
                      count: state.datingInfoModel?.balance ?? 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: Insets.l),
                      child: Text(
                        MenuI18n.candidates,
                        style: context.text.mainTextMedium
                            .copyWith(color: context.color.smallTextColor),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _MenuStatisticsCard(
                            title: MenuI18n.totalCandidates,
                            count: state.datingInfoModel!.totalCandidates
                                .toString(),
                          ),
                        ),
                        const SizedBox(
                          width: Insets.l,
                        ),
                        Expanded(
                          child: _MenuStatisticsCard(
                            title: MenuI18n.mutualSympathy,
                            count: state.datingInfoModel!.mutualSympathy
                                .toString(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _MenuStatisticsCard(
                            title: MenuI18n.youLiked,
                            count: state.datingInfoModel!.youLiked.toString(),
                          ),
                        ),
                        const SizedBox(
                          width: Insets.l,
                        ),
                        Expanded(
                          child: _MenuStatisticsCard(
                            title: MenuI18n.youSaidNo,
                            count: state.datingInfoModel!.youSaidNo.toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _MenuStatisticsCard extends StatelessWidget {
  const _MenuStatisticsCard({
    required this.title,
    required this.count,
  });

  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.text.smallTitleMedium.copyWith(
              fontSize: 18,
              height: 24 / 18,
            ),
          ),
          Text(
            count,
            style: context.text.numbers.copyWith(
              color: context.color.mainAccentColor,
            ),
          ),
        ],
      ),
    );
  }
}
