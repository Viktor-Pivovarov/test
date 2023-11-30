import 'package:flutter/material.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class KutaGridView extends StatelessWidget {
  const KutaGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.9,
      crossAxisSpacing: Insets.l,
      children: [
        KutaCard(
          number: '01',
          title: MenuI18n.varnaKuta,
          description: MenuI18n.varnaKutaDescription,
        ),
        KutaCard(
          number: '02',
          title: MenuI18n.vashyaKuta,
          description: MenuI18n.vashyaKutaDescription,
        ),
        KutaCard(
          number: '03',
          title: MenuI18n.taraKuta,
          description: MenuI18n.taraKutaDescription,
        ),
        KutaCard(
          number: '04',
          title: MenuI18n.yoniKuta,
          description: MenuI18n.yoniKutaDescription,
        ),
        KutaCard(
          number: '05',
          title: MenuI18n.grahamayatiKuta,
          description: MenuI18n.grahamayatiKutaDescription,
        ),
        KutaCard(
          number: '06',
          title: MenuI18n.ghanaKuta,
          description: MenuI18n.ghanaKutaDescription,
        ),
        KutaCard(
          number: '07',
          title: MenuI18n.bhakutKuta,
          description: MenuI18n.bhakutKutaDescription,
        ),
        KutaCard(
          number: '08',
          title: MenuI18n.nadiKuta,
          description: MenuI18n.nadiKutaDescription,
        ),
      ],
    );
  }
}

class KutaCard extends StatelessWidget {
  const KutaCard({
    required this.number,
    required this.title,
    required this.description,
    super.key,
  });

  final String number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
              number,
              style: context.text.numbers.copyWith(
                color: Colors.white,
                height: 32 / 64,
                fontSize: 64,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: Insets.xl, left: Insets.s),
              child: UiIcon(
                Assets.icons.iLogo,
                color: context.color.mainAccentColor,
                width: Insets.xl,
                height: Insets.xl,
              ),
            ),
          ],
        ),
        Text(title, style: context.text.smallTitleMedium),
        Text(
          description,
          style: context.text.mainText.copyWith(color: context.color.textColor),
        ),
      ],
    );
  }
}
