import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuDeleteAccountConfirmPage extends StatelessWidget {
  const MenuDeleteAccountConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuInjection.sl<MenuDeleteAccountCubit>()..init(),
      child: Scaffold(
        appBar: UiAppBar(
          title: Text(MenuI18n.confirmation),
          useColor: true,
        ),
        body: BlocBuilder<MenuDeleteAccountCubit, MenuDeleteAccountState>(
          builder: (context, state) {
            if (state.status.isFetchingInProgress) {
              return Center(
                child: UiCircleProgressIndicator(
                  color: context.color.mainAccentColor,
                ),
              );
            }

            if (state.status.isFetchingFailure) {
              return Center(
                child: Column(
                  children: [Text(state.error ?? '')],
                ),
              );
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Insets.xl,
                    vertical: Insets.xxxl,
                  ),
                  child: Text(
                    MenuI18n.confirmationDescription,
                    style: context.text.mainText
                        .copyWith(color: context.color.smallTextColor),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: Insets.xl,
                      bottom: Insets.bottomNavBar,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Insets.l),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: Insets.xl,
                                ),
                                child: Text(
                                  MenuI18n.whyDoYouWantToDelete,
                                  style: context.text.smallTitle.copyWith(
                                    color: context.color.smallTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: Insets.m,
                              bottom: Insets.m,
                              left: Insets.xl,
                            ),
                            child: ReactiveForm(
                              formGroup: state.form!,
                              child: ListView(
                                children: state.reasons
                                    .map(
                                      (e) => UiCheckboxField(
                                        label: e.name,
                                        formControl: state.form!
                                                .controls[e.id.toString()]!
                                            as FormControl<bool>,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        UiButton.text(
                          text: MenuI18n.deleteAccount,
                          onPressed: context
                              .read<MenuDeleteAccountCubit>()
                              .onSubmitDeleteAccount,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
