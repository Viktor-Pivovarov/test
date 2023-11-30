import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key, this.onResult});

  final OnResult? onResult;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);

    _controller.addStatusListener(_statusListener);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Future<void> _onFinish() async {
    await _verify();
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _onFinish();

      setState(() {});
    }
  }

  Future<void> _verify() async {
    await AppSettingsInjection.sl<AppSettingsCubit>().check();

    await AuthInjection.sl<AuthCubit>().init();
  }

  Future<void> _signOut() async {
    AuthInjection.sl<AuthCubit>().signOut();
  }

  Future<void> _onLoaded(LottieComposition composition) async {
    _controller
      ..duration = composition.duration
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(
              GlobalAssets.lottieAnimations.splash,
              width: double.infinity,
              repeat: false,
              fit: BoxFit.fitWidth,
              controller: _controller,
              onLoaded: _onLoaded,
            ),
          ),
          BlocProvider<AuthCubit>.value(
            value: AuthInjection.sl<AuthCubit>(),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state.error != null) {
                  return Positioned(
                    bottom: Insets.l,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(Insets.l),
                          child: Text(
                            state.error ?? '',
                            style: context.text.smallText.copyWith(
                              color: context.theme.colorScheme.error,
                            ),
                          ),
                        ),
                        UiButton.text(
                          text: 'Try again',
                          onPressed: _verify,
                        ),
                        UiButton.text(
                          text: 'Sign Out',
                          onPressed: _signOut,
                        ),
                      ],
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
