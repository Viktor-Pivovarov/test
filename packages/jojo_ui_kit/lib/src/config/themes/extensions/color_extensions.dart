import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:jojo_ui_kit/src/config/themes/theme_colors.dart';

class ThemeColorsExt extends ThemeExtension<ThemeColorsExt> {
  const ThemeColorsExt.light({
    this.bg = const ThemeColorsBgLight(),
    this.button = const ThemeColorsButtonLight(),
    this.content = const ThemeColorsContentLight(),
    this.system = const ThemeColorsSystemLight(),
    this.text = const ThemeColorsTextLight(),
  }) : _isDark = false;

  const ThemeColorsExt.dark({
    this.bg = const ThemeColorsBgDark(),
    this.button = const ThemeColorsButtonDark(),
    this.content = const ThemeColorsContentDark(),
    this.system = const ThemeColorsSystemDark(),
    this.text = const ThemeColorsTextDark(),
  }) : _isDark = true;

  final ThemeColorsBg bg;
  final ThemeColorsButton button;
  final ThemeColorsContent content;
  final ThemeColorsSystem system;
  final ThemeColorsText text;

  final bool _isDark;

  @override
  ThemeExtension<ThemeColorsExt> copyWith({
    ThemeColorsBg? bg,
    ThemeColorsButton? button,
    ThemeColorsContent? content,
    ThemeColorsSystem? system,
    ThemeColorsText? text,
  }) {
    if (_isDark) {
      return ThemeColorsExt.dark(
        bg: bg ?? this.bg,
        button: button ?? this.button,
        content: content ?? this.content,
        system: system ?? this.system,
        text: text ?? this.text,
      );
    }

    return ThemeColorsExt.light(
      bg: bg ?? this.bg,
      button: button ?? this.button,
      content: content ?? this.content,
      system: system ?? this.system,
      text: text ?? this.text,
    );
  }

  //TODO: требуются изменения в функции т.к. использует устаревшие цвета
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
  ThemeExtension<ThemeColorsExt> lerp(
    ThemeExtension<ThemeColorsExt>? other,
    double t,
  ) {
    if (other is! ThemeColorsExt) {
      return this;
    }

    if (_isDark) {
      return const ThemeColorsExt.dark();
    }

    return const ThemeColorsExt.light();
  }
}
