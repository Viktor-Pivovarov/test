import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class OnboardingAstrologicalPage extends StatelessWidget {
  const OnboardingAstrologicalPage({super.key});

  AuthCubit get _cubit => AuthInjection.sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.fillBgColor,
      appBar: const UiAppBar(),
      body: UiOnboarding(
        image: Assets.images.artGender,
        title: SignInI18n.astrologicalTitle,
        description: SignInI18n.astrologicalDescription,
        buttons: Column(
          children: [
            UiToggleFieldBordered<bool>(
              values: const <bool>[false, true],
              labels: <String>[
                SignInI18n.astrologicalShowBtn,
                SignInI18n.astrologicalRequiredBtn,
              ],
              onPressed: _cubit.onPressedAstrological,
            ),
          ],
        ),
      ),
    );
  }
}
