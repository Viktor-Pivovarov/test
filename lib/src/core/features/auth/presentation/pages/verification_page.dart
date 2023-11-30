import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class OnboardingVerificationPage extends StatelessWidget {
  const OnboardingVerificationPage({super.key});

  AuthCubit get _cubit => AuthInjection.sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.fillBgColor,
      appBar: const UiAppBar(),
      body: BlocBuilder<AuthCubit, AuthState>(
        bloc: AuthInjection.sl(),
        builder: (BuildContext context, AuthState state) {
          String img = Assets.images.selfie;

          if (state.gender?.isFemale ?? false) {
            img = Assets.images.protection;
          }

          return UiOnboarding(
            image: img,
            title: SignInI18n.verificationTitle(
              state.gender?.isMale ?? true,
            ),
            description: SignInI18n.verificationDescription(
              state.gender?.isMale ?? true,
            ),
            buttons: UiToggleFieldBordered<bool>(
              values: const <bool>[false, true],
              labels: <String>[CommonI18n.no, CommonI18n.yes],
              onPressed: _cubit.onPressedReadyToBeTested,
            ),
          );
        },
      ),
    );
  }
}
