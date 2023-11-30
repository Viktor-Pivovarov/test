import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class OnboardingCheckNotificationPage extends StatelessWidget {
  const OnboardingCheckNotificationPage({super.key});

  AuthCubit get _cubit => AuthInjection.sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UiAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: UiImage(
              Assets.images.notifiW,
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(Insets.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: Insets.l),
                      child: Text(
                        SignInI18n.checkNotificationTitle,
                        style: context.text.bigTitle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: Insets.s),
                      child: Text(
                        '${SignInI18n.reportOnlyImportant}:',
                        style:
                            context.text.numbers.copyWith(fontSize: Insets.l),
                      ),
                    ),
                    OrderedList(
                      texts: List.generate(
                        3,
                        (value) =>
                            SignInI18n.checkNotificationDescription('v$value'),
                      ),
                      style: context.text.smallTitle
                          .copyWith(color: context.color.smallTextColor),
                      numberStyle: context.text.smallTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Insets.l,
              Insets.l,
              Insets.l,
              Insets.xxl,
            ),
            child: BlocProvider<AuthCubit>.value(
              value: _cubit,
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (BuildContext context, AuthState state) {
                  return UiMainButton(
                    disabled: state.status.isFetchingInProgress,
                    text: CoreI18n.next,
                    onPressed:
                        context.read<AuthCubit>().onPressedEnableNotification,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
