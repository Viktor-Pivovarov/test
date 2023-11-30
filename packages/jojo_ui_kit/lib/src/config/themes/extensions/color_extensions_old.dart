import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@Deprecated('Use ThemeColorsExt')
class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    this.mainAccentColor = ThemeConfig.mainAccentColor,
    this.textColor = ThemeConfig.textColor,
    this.cardBGColor = ThemeConfig.cardBGColor,
    this.smallTextColor = ThemeConfig.smallTextColor,
    this.green = ThemeConfig.green,
    this.logoGradient = ThemeConfig.logoGradient,
    this.facebookColor = ThemeConfig.facebookColor,
    this.appleColor = ThemeConfig.appleColor,
    this.googleColor = ThemeConfig.googleColor,
    this.tgColor = ThemeConfig.tgColor,
    this.fillBgColor = ThemeConfig.white,
    this.btnIconColor = ThemeConfig.white,
    this.chatBG = ThemeConfig.chatBG,
    this.disabledColor = ThemeConfig.disabledColor,
    this.middleGray = ThemeConfig.middleGray,
    this.greyLight = ThemeConfig.greyLight,
    this.shadow = ThemeConfig.shadow,
    this.chatBgLight = ThemeConfig.chatBgLight,
    this.chatMessageBg = ThemeConfig.chatMessageBg,
    this.chatMessageBgLight = ThemeConfig.chatMessageBgLight,
    this.mainAccentShadowColor = ThemeConfig.mainAccentShadowColor,
    this.starColor = ThemeConfig.starColor,
    this.logoGlow = ThemeConfig.logoGlow,
  });

  final Color mainAccentColor;
  final Color textColor;
  final Color cardBGColor;
  final Color smallTextColor;
  final Color green;
  final Color facebookColor;
  final Color appleColor;
  final Color googleColor;
  final Color tgColor;
  final Color fillBgColor;
  final Color btnIconColor;
  final Color chatBG;
  final Color disabledColor;
  final Color middleGray;
  final Color greyLight;
  final Color shadow;
  final Color mainAccentShadowColor;
  final Color chatBgLight;
  final Color chatMessageBg;
  final Color chatMessageBgLight;
  final Color logoGlow;
  final Color starColor;
  final LinearGradient logoGradient;

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? mainAccentColor,
    Color? textColor,
    Color? cardBGColor,
    Color? smallTextColor,
    Color? green,
    Color? facebookColor,
    Color? appleColor,
    Color? googleColor,
    Color? tgColor,
    Color? fillBgColor,
    Color? btnIconColor,
    Color? chatBG,
    Color? middleGray,
    Color? greyLight,
    Color? shadow,
    Color? logoGlow,
    Color? mainAccentShadowColor,
    Color? chatBgLight,
    Color? chatMessageBg,
    Color? chatMessageBgLight,
    LinearGradient? logoGradient,
  }) {
    return ThemeColors(
      mainAccentColor: mainAccentColor ?? this.mainAccentColor,
      textColor: textColor ?? this.textColor,
      cardBGColor: cardBGColor ?? this.cardBGColor,
      smallTextColor: smallTextColor ?? this.smallTextColor,
      logoGradient: logoGradient ?? this.logoGradient,
      green: green ?? this.green,
      facebookColor: facebookColor ?? this.facebookColor,
      appleColor: appleColor ?? this.appleColor,
      fillBgColor: fillBgColor ?? this.fillBgColor,
      googleColor: googleColor ?? this.googleColor,
      tgColor: tgColor ?? this.tgColor,
      btnIconColor: btnIconColor ?? this.btnIconColor,
      chatBG: chatBG ?? this.chatBG,
      chatMessageBg: chatMessageBg ?? this.chatMessageBg,
      chatMessageBgLight: chatMessageBgLight ?? this.chatMessageBgLight,
      middleGray: middleGray ?? this.middleGray,
      greyLight: greyLight ?? this.greyLight,
      shadow: shadow ?? this.shadow,
      logoGlow: logoGlow ?? this.logoGlow,
      mainAccentShadowColor:
          mainAccentShadowColor ?? this.mainAccentShadowColor,
      chatBgLight: chatBgLight ?? this.chatBgLight,
    );
  }

  Color calculateScoreColor(int score, BuildContext context) {
    if (score < 18) {
      return context.color.mainAccentColor;
    }
    if (score >= 18 && score <= 24) {
      return context.color.smallTextColor;
    }

    return context.color.green;
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      mainAccentColor: Color.lerp(mainAccentColor, other.mainAccentColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      cardBGColor: Color.lerp(cardBGColor, other.cardBGColor, t)!,
      smallTextColor: Color.lerp(smallTextColor, other.smallTextColor, t)!,
      green: Color.lerp(green, other.green, t)!,
      facebookColor: Color.lerp(facebookColor, other.facebookColor, t)!,
      appleColor: Color.lerp(appleColor, other.appleColor, t)!,
      googleColor: Color.lerp(googleColor, other.googleColor, t)!,
      tgColor: Color.lerp(tgColor, other.tgColor, t)!,
      fillBgColor: Color.lerp(fillBgColor, other.fillBgColor, t)!,
      btnIconColor: Color.lerp(btnIconColor, other.btnIconColor, t)!,
      chatBG: Color.lerp(chatBG, other.chatBG, t)!,
      chatMessageBg: Color.lerp(chatMessageBg, other.chatMessageBg, t)!,
      chatMessageBgLight:
          Color.lerp(chatMessageBgLight, other.chatMessageBgLight, t)!,
      middleGray: Color.lerp(middleGray, other.middleGray, t)!,
      greyLight: Color.lerp(greyLight, other.greyLight, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      logoGlow: Color.lerp(logoGlow, other.logoGlow, t)!,
      mainAccentShadowColor:
          Color.lerp(mainAccentShadowColor, other.mainAccentShadowColor, t)!,
      chatBgLight: Color.lerp(chatBgLight, other.chatBgLight, t)!,
    );
  }

  static ThemeColors get light => const ThemeColors();

  @override
  String toString() => 'MyColors('
      'mainAccentColor: $mainAccentColor, '
      'textColor: $textColor, '
      'cardBGColor: $cardBGColor, '
      'smallTextColor: $smallTextColor, '
      'logoGradient: $logoGradient, '
      'green: $green )';
}
