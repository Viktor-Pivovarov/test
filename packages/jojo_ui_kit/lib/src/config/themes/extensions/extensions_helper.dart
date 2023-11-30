import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  @Deprecated('use colors')
  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;

  ThemeColorsExt get colors => Theme.of(this).extension<ThemeColorsExt>()!;

  @Deprecated('use texts')
  TextExtension get text => Theme.of(this).extension<TextExtension>()!;

  TextExt get texts => Theme.of(this).extension<TextExt>()!;

  EffectsExtensions get effects =>
      Theme.of(this).extension<EffectsExtensions>()!;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Size get mediaSize => MediaQuery.of(this).size;
}
