import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuTariffsPage extends StatefulWidget {
  const MenuTariffsPage({super.key});

  @override
  State<MenuTariffsPage> createState() => _MenuTariffsPageState();
}

class _MenuTariffsPageState extends State<MenuTariffsPage> {
  @override
  void initState() {
    super.initState();

    context.read<MenuTariffCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        useColor: true,
        title: Text(
          MenuI18n.tariffsAndPayment,
          style: context.text.mainTitleMedium,
        ),
      ),
      body: BlocBuilder<MenuTariffCubit, MenuTariffState>(
        builder: (context, state) {
          if ((state.status.isFetchingInProgress ||
                  state.status.isFetchingFailure) &&
              state.onlyTariffs.isEmpty) {
            return Center(
              child: UiCircleProgressIndicator(
                color: context.color.mainAccentColor,
                width: Insets.xxxxl,
                height: Insets.xxxxl,
              ),
            );
          }

          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: UiIcon(
                  Assets.icons.clouds,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: Insets.l,
                  right: Insets.l,
                  top: Insets.l,
                  bottom: Insets.bottomNavBar,
                ),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '${MenuI18n.whenPay} '.toUpperCase(),
                        style: context.text.smallTitle.copyWith(
                          fontWeight: FontWeight.w300,
                          color: context.color.textColor,
                        ),
                        children: [
                          TextSpan(
                            text: MenuI18n.valuable.toUpperCase(),
                            style: context.text.smallTitle.copyWith(
                              fontWeight: FontWeight.w700,
                              color: context.color.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Insets.m,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...state.onlyTariffs.map((e) {
                              final count = int.tryParse(e.quantity) ?? 0;
                              final index = state.onlyTariffs.indexOf(e);
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Insets.s,
                                ),
                                child: TariffCard(
                                  count: count,
                                  title: MenuI18n.acquaintancesPlural(count),
                                  price: count > 1
                                      ? 'CHF ${e.pricePerMeet} / ${MenuI18n.acq}'
                                      : '',
                                  totalPrice: 'CHF ${e.cost}',
                                  discount: MenuI18n.save,
                                  hint: e.sticker.toUpperCase(),
                                  percent: e.discount,
                                  type: getType(index),
                                  onTap: () => context
                                      .read<MenuTariffCubit>()
                                      .onTapTariff(e),
                                ),
                              );
                            }),
                            const SizedBox(
                              height: Insets.xxl,
                            ),
                            Text(
                              MenuI18n.writeOffOccurs,
                              style: context.text.mainText.copyWith(
                                color: context.color.smallTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  TariffCardType getType(int index) {
    switch (index) {
      case 0:
        return TariffCardType.secondary;
      case 1:
        return TariffCardType.primary;
      default:
        return TariffCardType.normal;
    }
  }
}
