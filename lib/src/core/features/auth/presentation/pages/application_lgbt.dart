import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_supporting/jojo_supporting.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class ApplicationLgbtPage extends StatelessWidget {
  const ApplicationLgbtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bg.primary,
      appBar: const UiAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Insets.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Insets.l,
                        bottom: Insets.l,
                      ),
                      child: Align(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.7,
                          child: PulseIndicator(
                            shader: context.colors.content.lgbtqGradient
                                .createShader(
                              const Rect.fromLTWH(10, 80, 0, 100),
                            ),
                            child: UiImage(
                              AssetsNew.images.registration.lgbt.path,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      SignInI18n.lgbtInfo,
                      style: context.texts.body.bodyLight.copyWith(
                        color: context.colors.text.main,
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
              child: UiMainButton(
                text: SignInI18n.buttonLgbtSendAppl,
                onPressed: () async {
                  final result = await context.router.push(
                    const SupportingRoute(),
                  );
                  if (result != null) {
                    unawaited(context.router.pop());
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
