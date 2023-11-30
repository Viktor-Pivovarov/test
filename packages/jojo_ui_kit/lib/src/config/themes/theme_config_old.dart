import 'package:flutter/material.dart';

@Deprecated('For colors user ThemeColors')
class ThemeConfig {
  static const Color mainAccentColor = Color(0xffF6193D);
  static const Color mainAccentShadowColor = Color.fromARGB(75, 246, 25, 62);
  static const Color textColor = Color(0xff303131);
  static const Color cardBGColor = Color(0xffF2F4F6);
  static const Color smallTextColor = Color(0xff8995A4);
  static const Color facebookColor = Color(0xff4267B2);
  static const Color appleColor = Color(0xff000000);
  static const Color googleColor = Color(0xff000000);
  static const Color tgColor = Color(0xff2F80ED);
  static const Color white = Color(0xffffffff);
  static const Color chatBG = Color(0xff98A8B8);
  static const Color background = Color(0xffF2F4F6);
  static const Color disabledColor = Color.fromARGB(255, 210, 209, 209);
  static const Color middleGray = Color(0xffE3E8EE);
  static const Color greyLight = Color(0xFFF2F4F6);
  static const Color shadow = Color.fromARGB(25, 115, 145, 166);
  static const Color chatBgLight = Color(0xFFE0E5EA);
  static const Color chatMessageBg = Colors.white;
  static const Color chatMessageBgLight = Color(0xFFE0E5EA);
  static const Color starColor = Color(0xFFFFCA41);

  static const LinearGradient logoGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Color(0xffF66919), Color(0xffF6196C), Color(0xffF6193D)],
  );

  static const LinearGradient lgbt = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xffFF4141),
      Color(0xffFB8E3F),
      Color(0xffF5F06D),
      Color(0xffB7F095),
      Color(0xff6AF0E8),
      Color(0xff4A52FF),
      Color(0xffE230FF),
    ],
  );

  static const Color logoGlow = Color.fromARGB(68, 247, 26, 74);

  static const Color green = Color(0xff27AE60);
}
