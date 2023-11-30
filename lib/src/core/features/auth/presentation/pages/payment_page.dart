import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class OnboardingPaymentPage extends StatelessWidget {
  const OnboardingPaymentPage({super.key});

  AuthCubit get _cubit => AuthInjection.sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.fillBgColor,
      appBar: const UiAppBar(),
      body: BlocBuilder<AuthCubit, AuthState>(
        bloc: AuthInjection.sl(),
        builder: (BuildContext context, AuthState state) {
          return UiOnboarding(
            image: Assets.images.match,
            title: SignInI18n.paymentTitle(state.gender?.isMale ?? true),
            description: SignInI18n.paymentDescription(
              state.gender?.isMale ?? true,
            ),
            buttons: Center(
              child: UiToggleFieldBordered<bool>(
                values: const <bool>[false, true],
                labels: <String>[CommonI18n.no, CommonI18n.yes],
                onPressed: _cubit.onPressedConfirmPayment,
              ),
            ),
          );
        },
      ),
    );
  }
}
