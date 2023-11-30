import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class OnboardingSelectSexPage extends StatelessWidget {
  const OnboardingSelectSexPage({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: UiImage(Assets.images.coupleInMandala),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: Insets.l,
                    ),
                    child: Text(
                      SignInI18n.chooseYourSex,
                      style: context.texts.headline.second,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: parseToLinks(
                        SignInI18n.yourSexHint,
                        <Function>[_cubit.onPressedLgbt],
                        context.colors.text.link,
                      ),
                      style: context.texts.body.bodyLight.copyWith(
                        color: context.colors.text.main,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                Insets.l,
                Insets.l,
                Insets.l,
                Insets.xxxl,
              ),
              child: UiToggleFieldBordered<Gender>(
                values: const <Gender>[Gender.male, Gender.female],
                labels: <String>[CommonI18n.male, CommonI18n.female],
                onPressed: _cubit.onPressedSex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
