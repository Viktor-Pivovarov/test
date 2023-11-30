import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/core/_core.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class RatingCarousel extends StatelessWidget {
  const RatingCarousel(this.rating, {super.key});

  final double rating;

  double get value => (rating * 100 / 32) / 100;

  int get initialPage {
    if (rating < 18) {
      return 0;
    }

    if (rating >= 25 && rating <= 32) {
      return 2;
    }

    if (rating > 32) {
      return 3;
    }

    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 176,
          enableInfiniteScroll: false,
          initialPage: initialPage,
        ),
        items: <Widget>[
          RatingCarouselItem(
            color: context.theme.colorScheme.error,
            title: SelectionI18n.astrologicalLess18Title,
            description: SelectionI18n.astrologicalLess18Desc,
          ),
          RatingCarouselItem(
            color: context.theme.iconTheme.color!,
            title: SelectionI18n.astrological1825Title,
            description: SelectionI18n.astrological1825Desc,
          ),
          RatingCarouselItem(
            color: context.color.green,
            title: SelectionI18n.astrological2532Title,
            description: SelectionI18n.astrological2532Desc,
          ),
          RatingCarouselItem(
            color: context.color.smallTextColor,
            title: SelectionI18n.astrologicalMore32Title,
            description: SelectionI18n.astrologicalMore32Desc,
          ),
        ],
      ),
    );
  }
}
