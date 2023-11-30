import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key, this.onResult});

  final OnResult? onResult;

  AuthCubit get _delegate => AuthInjection.sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                Insets.l,
                Insets.l,
                Insets.l,
                Insets.zero,
              ),
              child: Text(
                WelcomeSheetI18n.title,
                style: context.texts.headline.big
                    .copyWith(color: context.colors.text.main),
              ),
            ),
          ),
          UiImage(Assets.images.happyMan),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(Insets.xl),
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(BorderRadiusInsets.xl),
                  topRight: Radius.circular(BorderRadiusInsets.xl),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (AppConstants.isIOS)
                    UiAppleButton(
                      text: SignInI18n.signUpWithApple,
                      padding: const EdgeInsets.only(bottom: Insets.l),
                      onPressed: () => _delegate.onPressedAuthByType(
                        SignUpType.appleId,
                        onResult,
                      ),
                    ),
                  if (AppConstants.isAndroid)
                    UiGoogleButton(
                      text: SignInI18n.signUpWithGoogle,
                      padding: const EdgeInsets.only(bottom: Insets.l),
                      onPressed: () => _delegate.onPressedAuthByType(
                        SignUpType.google,
                        onResult,
                      ),
                    ),
                  UiTelegramButton(
                    text: SignInI18n.signUpWithTG,
                    disabled: true,
                    padding: const EdgeInsets.only(bottom: 4),
                    onPressed: () => _delegate.onPressedAuthByType(
                      SignUpType.tg,
                      onResult,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        SignInI18n.tgAdditional,
                        style: context.texts.body.baseSemibold
                            .copyWith(color: context.colors.content.brand),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, bottom: 6),
                        child: UiIcon(
                          Assets.icons.iTgAdditional,
                          color: context.color.mainAccentColor,
                        ),
                      ),
                    ],
                  ),
                  const UiDivider(
                    margin: EdgeInsets.symmetric(vertical: Insets.l),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: context.texts.footnote.base
                          .copyWith(color: context.colors.text.secondary),
                      children: parseToLinks(
                        SignInI18n.privacy,
                        <Function>[
                          _delegate.onPressedTermsOfUse,
                          _delegate.onPressedPrivacyPolicy,
                        ],
                        context.colors.text.link,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: Insets.l),
                  //   child: Text(
                  //     WelcomeSheetI18n.description,
                  //     style: context.text.mainText,
                  //   ),
                  // ),
                  // UiButton(
                  //   onPressed: () => _delegate.onPressedSignUp(onResult),
                  //   text: WelcomeSheetI18n.signUpBtn,
                  // ),
                  // UiButton.outline(
                  //   onPressed: () => _delegate.onPressedSignIn(onResult),
                  //   text: WelcomeSheetI18n.singInBtn,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
