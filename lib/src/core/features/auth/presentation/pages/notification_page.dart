import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class OnboardingNotificationPage extends StatelessWidget {
  const OnboardingNotificationPage({super.key});

  AuthCubit get _cubit => AuthInjection.sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.fillBgColor,
      appBar: const UiAppBar(),
      body: BlocBuilder<AuthCubit, AuthState>(
        bloc: AuthInjection.sl(),
        builder: (BuildContext context, AuthState state) {
          String img = Assets.images.threeGirls;

          if (state.gender?.isFemale ?? false) {
            img = Assets.images.threeMan;
          }

          return UiOnboarding(
            image: img,
            title: SignInI18n.notificationTitle(
              state.gender?.isMale ?? true,
            ),
            description: SignInI18n.notificationDescription(
              state.gender?.isMale ?? true,
            ),
            buttons: UiToggleFieldBordered<PickupTime>(
              values: const <PickupTime>[
                PickupTime.morning,
                PickupTime.evening,
              ],
              labels: <String>[
                CommonI18n.inTheMorning,
                CommonI18n.inTheEvening,
              ],
              onPressed: _cubit.onPressedTimeToNotify,
            ),
          );
        },
      ),
    );
  }
}
