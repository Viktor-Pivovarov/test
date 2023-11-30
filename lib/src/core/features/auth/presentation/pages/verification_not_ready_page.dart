import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class OnboardingVerificationNotReadyPage extends StatelessWidget {
  const OnboardingVerificationNotReadyPage({super.key});

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
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(Insets.l),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: Insets.l),
                        child: Text(
                          SignInI18n.verificationNotReadyTitle,
                          style: context.text.bigTitle,
                        ),
                      ),
                      Text(
                        SignInI18n.verificationNotDescription,
                        style: context.text.mainText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: UiImage(
                      Assets.images.verificationNotReady,
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
            child: UiMainButton(
              onPressed: () {
                context.router.pop();
                _cubit.onPressedReadyToBeTested(true);
              },
              text: SignInI18n.continueRegistrationBtn,
            ),
          ),
        ],
      ),
    );
  }
}
