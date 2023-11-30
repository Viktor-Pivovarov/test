import 'package:flutter/material.dart';

abstract class ThemeColorsBg {
  const ThemeColorsBg();

  Color get primary;

  Color get secondary;

  Color get tertiary;

  Color get brand;

  Color get darker;

  Color get chips;
}

class ThemeColorsBgLight implements ThemeColorsBg {
  const ThemeColorsBgLight();

  @override
  Color get primary => const Color(0xFFF2F4F6);

  @override
  Color get secondary => const Color(0xFFFFFFFF);

  @override
  Color get tertiary => const Color(0xFFE0E5EA);

  @override
  Color get brand => const Color(0xFFF6193D);

  @override
  Color get darker => const Color(0xB2313131);

  @override
  Color get chips => const Color(0xFFE8EBEF);
}

class ThemeColorsBgDark implements ThemeColorsBg {
  const ThemeColorsBgDark();

  @override
  Color get primary => const Color(0xFFF2F4F6);

  @override
  Color get secondary => const Color(0xFFFFFFFF);

  @override
  Color get tertiary => const Color(0xFFE0E5EA);

  @override
  Color get brand => const Color(0xFFF6193D);

  @override
  Color get darker => const Color(0xB2313131);

  @override
  Color get chips => const Color(0xFFE8EBEF);
}

abstract class ThemeColorsButton {
  const ThemeColorsButton();

  Color get brand;

  Color get positive;

  Color get disabled;

  Color get telegram;

  Color get inverse;
}

class ThemeColorsButtonLight implements ThemeColorsButton {
  const ThemeColorsButtonLight();

  @override
  Color get brand => const Color(0xFFF6193D);

  @override
  Color get positive => const Color(0xFF27AE60);

  @override
  Color get disabled => const Color(0xFF8995A4);

  @override
  Color get telegram => const Color(0xFF2F80ED);

  @override
  Color get inverse => const Color(0xFFFFFFFF);
}

class ThemeColorsButtonDark implements ThemeColorsButton {
  const ThemeColorsButtonDark();

  @override
  Color get brand => const Color(0xFFF6193D);

  @override
  Color get positive => const Color(0xFF27AE60);

  @override
  Color get disabled => const Color(0xFF8995A4);

  @override
  Color get telegram => const Color(0xFF2F80ED);

  @override
  Color get inverse => const Color(0xFFFFFFFF);
}

abstract class ThemeColorsContent {
  const ThemeColorsContent();

  Color get brand;

  Color get positive;

  Color get secondary;

  Color get tertiary;

  Color get telegram;

  Color get inverse;

  Color get base;

  Color get success;

  Color get gold;

  Color get divider;

  LinearGradient get brandGradient;

  LinearGradient get lgbtqGradient;
}

class ThemeColorsContentLight implements ThemeColorsContent {
  const ThemeColorsContentLight();

  @override
  Color get brand => const Color(0xFFF6193D);

  @override
  Color get positive => const Color(0xFF27AE60);

  @override
  Color get secondary => const Color(0xFF8995A4);

  @override
  Color get tertiary => const Color(0xFFD5DBE3);

  @override
  Color get telegram => const Color(0xFF2F80ED);

  @override
  Color get inverse => const Color(0xFFFFFFFF);

  @override
  Color get base => const Color(0xFF313131);

  @override
  Color get success => const Color(0xFF27AE60);

  @override
  Color get gold => const Color(0xFFFFCA41);

  @override
  Color get divider => const Color(0xFF8995A4);

  @override
  LinearGradient get brandGradient => const LinearGradient(
        colors: [
          Color(0xFFF66919),
          Color(0xFFF6196C),
          Color(0xFFF6193D),
        ],
        stops: [
          7.24 / 100,
          49.14 / 100,
          93.75 / 100,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  LinearGradient get lgbtqGradient => const LinearGradient(
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
}

class ThemeColorsContentDark implements ThemeColorsContent {
  const ThemeColorsContentDark();

  @override
  Color get brand => const Color(0xFFF6193D);

  @override
  Color get positive => const Color(0xFF27AE60);

  @override
  Color get secondary => const Color(0xFF8995A4);

  @override
  Color get tertiary => const Color(0xFFD5DBE3);

  @override
  Color get telegram => const Color(0xFF2F80ED);

  @override
  Color get inverse => const Color(0xFFFFFFFF);

  @override
  Color get base => const Color(0xFF313131);

  @override
  Color get success => const Color(0xFF27AE60);

  @override
  Color get gold => const Color(0xFFFFCA41);

  @override
  Color get divider => const Color(0xFF8995A4);

  @override
  LinearGradient get brandGradient => const LinearGradient(
        colors: [
          Color(0xFFF66919),
          Color(0xFFF6196C),
          Color(0xFFF6193D),
        ],
        stops: [
          7.24 / 100,
          49.14 / 100,
          93.75 / 100,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  LinearGradient get lgbtqGradient => const LinearGradient(
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
}

abstract class ThemeColorsSystem {
  const ThemeColorsSystem();

  Color get base;

  Color get inverse;
}

class ThemeColorsSystemLight implements ThemeColorsSystem {
  const ThemeColorsSystemLight();

  @override
  Color get base => const Color(0xFF000000);

  @override
  Color get inverse => const Color(0xFFFFFFFF);
}

class ThemeColorsSystemDark implements ThemeColorsSystem {
  const ThemeColorsSystemDark();

  @override
  Color get base => const Color(0xFF000000);

  @override
  Color get inverse => const Color(0xFFFFFFFF);
}

abstract class ThemeColorsText {
  const ThemeColorsText();

  Color get constantWhite;

  Color get main;

  Color get secondary;

  Color get link;

  Color get green;

  Color get error;
}

class ThemeColorsTextLight implements ThemeColorsText {
  const ThemeColorsTextLight();

  @override
  Color get constantWhite => const Color(0xFFFFFFFF);

  @override
  Color get main => const Color(0xFF313131);

  @override
  Color get secondary => const Color(0xFF8995A4);

  @override
  Color get link => const Color(0xFFF6193D);

  @override
  Color get green => const Color(0xFF000000);

  @override
  Color get error => const Color(0xFF27AE60);
}

class ThemeColorsTextDark implements ThemeColorsText {
  const ThemeColorsTextDark();

  @override
  Color get constantWhite => const Color(0xFFFFFFFF);

  @override
  Color get main => const Color(0xFF313131);

  @override
  Color get secondary => const Color(0xFF8995A4);

  @override
  Color get link => const Color(0xFFF6193D);

  @override
  Color get green => const Color(0xFF000000);

  @override
  Color get error => const Color(0xFF27AE60);
}
