const String _assetsPath = 'assets';

class LottieAnimations {
  const LottieAnimations();

  String get splash => '$_assetsPath/splash_animation.json';
}

abstract class GlobalAssets {
  static const LottieAnimations lottieAnimations = LottieAnimations();
}
