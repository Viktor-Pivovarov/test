import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class TariffCard extends StatelessWidget {
  const TariffCard({
    required this.count,
    required this.title,
    required this.totalPrice,
    this.hint = '',
    this.price = '',
    this.discount = '',
    this.percent = 0,
    this.type = TariffCardType.normal,
    this.onTap,
    super.key,
  });

  final int count;
  final String title;
  final String totalPrice;
  final String price;
  final String discount;
  final int percent;
  final String hint;

  final TariffCardType type;

  final VoidCallback? onTap;

  static const double _cardHeight = 116;

  int _digits(int value) {
    return value.toString().length;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _cardHeight,
      child: Stack(
        children: [
          const SizedBox(
            height: _cardHeight,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 104,
              width: double.infinity,
              decoration: decoration(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Insets.l),
                ),
                margin: const EdgeInsets.all(1),
                child: InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Insets.xl,
                      vertical: Insets.xl,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: _digits(count) * 36,
                          child: Text(
                            count.toString(),
                            textAlign: TextAlign.left,
                            style: context.text.bigTitle.copyWith(
                              fontSize: 56,
                              letterSpacing: -5,
                              color: context.color.mainAccentColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: Insets.s,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: Insets.xs,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      title,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          context.text.mainTextMedium.copyWith(
                                        fontSize: Insets.l,
                                        color: context.color.textColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: Insets.s,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      totalPrice,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          context.text.mainTextMedium.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: context.color.textColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Visibility(
                              visible: discount.isNotEmpty && percent > 0,
                              child: RichText(
                                text: TextSpan(
                                  text: '$discount: ',
                                  style: context.text.mainTextMedium.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: context.color.mainAccentColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: percent.toString(),
                                      style: context.text.mainText.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: context.color.mainAccentColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '%',
                                      style:
                                          context.text.mainTextMedium.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: context.color.mainAccentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: Insets.s,
                            ),
                            Text(
                              price,
                              style: context.text.smallText.copyWith(
                                fontWeight: FontWeight.w500,
                                color: context.color.smallTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (hint.isNotEmpty)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: Insets.xl),
                child: Container(
                  height: Insets.xl,
                  decoration: BoxDecoration(
                    color: type == TariffCardType.primary
                        ? null
                        : context.color.smallTextColor,
                    gradient: type == TariffCardType.primary
                        ? context.color.logoGradient
                        : null,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Insets.m),
                    child: Text(
                      hint,
                      style: context.text.ultraSmallText.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        height: 2,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  BoxDecoration decoration(BuildContext context) {
    switch (type) {
      case TariffCardType.primary:
        return BoxDecoration(
          gradient: context.color.logoGradient,
          borderRadius: const BorderRadius.all(Radius.circular(Insets.l)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(32, 246, 25, 61),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        );
      case TariffCardType.secondary:
        return BoxDecoration(
          color: context.color.smallTextColor,
          border: const Border(),
          borderRadius: const BorderRadius.all(Radius.circular(Insets.l)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(32, 137, 149, 164),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        );
      case TariffCardType.normal:
        return const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(Insets.l)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(32, 137, 149, 164),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        );
    }
  }
}

enum TariffCardType { primary, secondary, normal }
