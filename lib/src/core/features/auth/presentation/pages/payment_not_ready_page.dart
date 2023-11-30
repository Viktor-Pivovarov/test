import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class OnboardingPaymentNotReadyPage extends StatelessWidget {
  const OnboardingPaymentNotReadyPage({super.key});

  AuthCubit get _cubit => AuthInjection.sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.fillBgColor,
      appBar: const UiAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(Insets.l),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: Insets.l),
                        child: Text(
                          SignInI18n.paymentNotReadyTitle,
                          style: context.text.bigTitle,
                        ),
                      ),
                      Text(
                        SignInI18n.paymentNotReadyDescription,
                        style: context.text.smallTitle
                            .copyWith(color: context.color.smallTextColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: UiImage(
                      Assets.images.paymentNotReady,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Insets.l,
              Insets.l,
              Insets.l,
              Insets.xxl,
            ),
            child: UiButton(
              onPressed: () => _cubit.onPressedContinueRegistration(
                canContinue: true,
              ),
              text: SignInI18n.continueRegistrationBtn,
              suffixIcon: UiIcon(
                Assets.icons.iHeartSearchFinished,
                color: context.color.fillBgColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
