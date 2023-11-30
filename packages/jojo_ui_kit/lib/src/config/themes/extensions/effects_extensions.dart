import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/src/config/config.dart';

class EffectsExtensions extends ThemeExtension<EffectsExtensions> {
  const EffectsExtensions.light({
    this.redGlow = EffectsStylesLight.redGlow,
    this.greenGlow = EffectsStylesLight.greenGlow,
    this.blueGlow = EffectsStylesLight.blueGlow,
    this.goldenGlow = EffectsStylesLight.goldenGlow,
    this.tabBarShadow = EffectsStylesLight.tabBarShadow,
  }) : _isDark = false;

  const EffectsExtensions.dark({
    this.redGlow = EffectStylesDark.redGlow,
    this.greenGlow = EffectStylesDark.greenGlow,
    this.blueGlow = EffectStylesDark.blueGlow,
    this.goldenGlow = EffectStylesDark.goldenGlow,
    this.tabBarShadow = EffectStylesDark.tabBarShadow,
  }) : _isDark = true;

  final BoxShadow redGlow;
  final BoxShadow greenGlow;
  final BoxShadow blueGlow;
  final BoxShadow goldenGlow;
  final BoxShadow tabBarShadow;

  final bool _isDark;

  @override
  ThemeExtension<EffectsExtensions> copyWith({
    BoxShadow? redGlow,
    BoxShadow? greenGlow,
    BoxShadow? blueGlow,
    BoxShadow? goldenGlow,
    BoxShadow? tabBarShadow,
  }) {
    if (_isDark) {
      return EffectsExtensions.dark(
        redGlow: redGlow ?? this.redGlow,
        greenGlow: greenGlow ?? this.greenGlow,
        blueGlow: blueGlow ?? this.blueGlow,
        goldenGlow: goldenGlow ?? this.goldenGlow,
        tabBarShadow: tabBarShadow ?? this.tabBarShadow,
      );
    }

    return EffectsExtensions.light(
      redGlow: redGlow ?? this.redGlow,
      greenGlow: greenGlow ?? this.greenGlow,
      blueGlow: blueGlow ?? this.blueGlow,
      goldenGlow: goldenGlow ?? this.goldenGlow,
      tabBarShadow: tabBarShadow ?? this.tabBarShadow,
    );
  }

  @override
  ThemeExtension<EffectsExtensions> lerp(
    ThemeExtension<EffectsExtensions>? other,
    double t,
  ) {
    if (other is! EffectsExtensions) {
      return this;
    }

    if (_isDark) {
      return const EffectsExtensions.dark();
    }

    return const EffectsExtensions.light();
  }
}
