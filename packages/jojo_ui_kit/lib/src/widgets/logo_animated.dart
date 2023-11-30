import 'package:flutter/material.dart';

class UiLogoAnimated extends StatelessWidget {
  const UiLogoAnimated({super.key, this.controller});

  final AnimationController? controller;

  @override
  Widget build(BuildContext context) {
    return Container();
    // TODO deprecated
    // return Lottie.asset(
    //   Assets.animations.splash,
    //   package: 'jojo_ui_kit',
    //   controller: controller,
    //   onLoaded: (LottieComposition composition) {
    //     if (controller != null) {
    //       controller!
    //         ..duration = composition.duration
    //         ..forward();
    //     }
    //   },
    // );
  }
}
