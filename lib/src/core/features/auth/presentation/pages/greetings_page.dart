import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class GreetingsPage extends StatelessWidget {
  const GreetingsPage({super.key});

  AuthCubit get _cubit => AuthInjection.sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bg.secondary,
      appBar: const UiAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.l),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: Insets.l,
                      ),
                      child: Text(
                        SignInI18n.greetingTitle,
                        style: context.texts.headline.big,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: Insets.l,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: context.texts.body.bodyLight.copyWith(
                            color: context.colors.text.main,
                          ),
                          children: parseToLinks(
                            SignInI18n.greetingInfo,
                            <Function>[
                              () {
                                // TODO-Pavlov ожидаем описания перехода
                              },
                            ],
                            context.colors.text.link,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      SignInI18n.greetingFromJOJO,
                      style: context.texts.body.baseSemibold.copyWith(
                        color: context.colors.text.link,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: Insets.l,
                right: Insets.l,
                top: Insets.l,
                bottom: Insets.xxxl,
              ),
              child: UiButton(
                text: SignInI18n.greetingAgreement,
                onPressed: () => _cubit.onPressedGreetings(consent: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
