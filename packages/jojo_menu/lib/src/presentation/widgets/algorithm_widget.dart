import 'package:flutter/material.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_menu/src/presentation/widgets/algorithm_scale_widget.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class AlgorithmWidget extends StatelessWidget {
  const AlgorithmWidget({super.key});

  List<({String name, int score, String image, int married, int children})>
      get couples => [
            (
              name: MenuI18n.davidAndVictoria,
              score: 29,
              image: Assets.images.couple,
              married: 1999,
              children: 4
            ),
            (
              name: MenuI18n.willAndJada,
              score: 29,
              image: Assets.images.will,
              married: 1997,
              children: 3
            ),
            (
              name: MenuI18n.alexseyAndYulia,
              score: 29,
              image: Assets.images.navalniy,
              married: 2000,
              children: 1
            ),
            (
              name: MenuI18n.messi,
              score: 29,
              image: Assets.images.messi,
              married: 2008,
              children: 3
            ),
            (
              name: MenuI18n.meryl,
              score: 29,
              image: Assets.images.oldCouple,
              married: 1978,
              children: 4
            ),
            (
              name: MenuI18n.zidan,
              score: 29,
              image: Assets.images.zidan,
              married: 1994,
              children: 4
            ),
          ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: Insets.getDefaultPageInsetsWithBottomBar(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MenuI18n.synastry,
            style: context.text.mainTitleMedium,
          ),
          const SizedBox(
            height: Insets.l,
          ),
          AlgorithmFactWidget(text: MenuI18n.synastryFact1),
          const SizedBox(
            height: Insets.l,
          ),
          AlgorithmFactWidget(text: MenuI18n.synastryFact2),
          const SizedBox(
            height: Insets.l,
          ),
          AlgorithmFactWidget(text: MenuI18n.synastryFact3),
          const SizedBox(
            height: Insets.xxl,
          ),
          Text(
            MenuI18n.examplesOfCouples,
            style: context.text.smallTitleMedium,
          ),
          const SizedBox(
            height: Insets.m,
          ),
          Text(
            MenuI18n.examplesOfCouples,
            style:
                context.text.mainText.copyWith(color: context.color.textColor),
          ),
          const SizedBox(
            height: Insets.xl,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CoupleWidget(
              title: couples[index].name,
              score: couples[index].score,
              asset: couples[index].image,
              marriedYear: couples[index].married,
              children: couples[index].children,
            ),
            separatorBuilder: (context, index) => const UiDivider(),
            itemCount: couples.length,
          ),
          Text(
            MenuI18n.ashtakuta,
            style: context.text.smallTitleMedium,
          ),
          const SizedBox(
            height: Insets.s,
          ),
          Text(
            MenuI18n.ashtakutaParagraph1,
            style:
                context.text.mainText.copyWith(color: context.color.textColor),
          ),
          const SizedBox(
            height: Insets.l,
          ),
          Text(
            MenuI18n.ashtakutaParagraph2,
            style:
                context.text.mainText.copyWith(color: context.color.textColor),
          ),
          const SizedBox(
            height: Insets.l,
          ),
          Text(
            MenuI18n.ashtakutaParagraph2,
            style:
                context.text.mainText.copyWith(color: context.color.textColor),
          ),
          const SizedBox(
            height: Insets.l,
          ),
          Text(
            MenuI18n.ashtakutaParagraph3,
            style:
                context.text.mainText.copyWith(color: context.color.textColor),
          ),
          const SizedBox(
            height: Insets.l,
          ),
          Text(
            MenuI18n.ashtakutaParagraph4,
            style:
                context.text.mainText.copyWith(color: context.color.textColor),
          ),
          const SizedBox(
            height: Insets.xxl,
          ),
          const SizedBox(
            height: Insets.l,
          ),
          const KutaGridView(),
          Text(
            MenuI18n.kutasFinal,
            style:
                context.text.mainText.copyWith(color: context.color.textColor),
          ),
          const SizedBox(
            height: Insets.xxl,
          ),
          const AlgorithmScaleWidget(),
        ],
      ),
    );
  }
}
