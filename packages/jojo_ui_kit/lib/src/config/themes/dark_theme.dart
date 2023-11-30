import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:jojo_ui_kit/src/config/themes/theme_colors.dart';

ThemeData createDarkTheme() {
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.light,
      const ThemeColorsExt.dark(),
      const EffectsExtensions.dark(),
      TextExtension.light,
      const TextExt.dark(),
    ],
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ThemeConfig.background,
    colorScheme: const ColorScheme.dark(),
    primaryColor: ThemeConfig.mainAccentColor,
    radioTheme: RadioThemeData(
      fillColor:
          MaterialStateProperty.resolveWith((states) => ThemeConfig.green),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      toolbarTextStyle: TextStyles.mainTitle.copyWith(
        color: ThemeConfig.textColor,
      ),
      titleTextStyle: TextStyles.mainTitle.copyWith(
        color: ThemeConfig.textColor,
      ),
      titleSpacing: Insets.zero,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: false,
      iconTheme:  IconThemeData(color: const ThemeColorsContentDark().inverse),
      actionsIconTheme: const IconThemeData(color: ThemeConfig.textColor),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ThemeConfig.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: ThemeConfig.smallTextColor,
        disabledForegroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: ThemeConfig.mainAccentColor,
        minimumSize: const Size(96, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            BorderRadiusInsets.xxxl,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        textStyle: TextStyles.smallTitle.copyWith(color: ThemeConfig.white),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ThemeConfig.mainAccentColor,
        minimumSize: const Size(96, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            BorderRadiusInsets.xxxl,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        side: const BorderSide(color: ThemeConfig.mainAccentColor),
        textStyle: TextStyles.smallTitle.copyWith(
          color: ThemeConfig.mainAccentColor,
        ),
      ),
    ),
    cardColor: ThemeConfig.white,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(48),
        // borderSide: const BorderSide(color: ThemeConfig.),
      ),
      fillColor: ThemeConfig.white,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Insets.l,
        horizontal: Insets.l * 1.5,
      ),
      // hintStyle: basic.CyrillicFonts.montserrat(
      //   color: ThemeConfig.greyBlue,
      //   fontSize: 14.0,
      //   fontWeight: FontWeight.w500,
      //   height: 16 / 14,
      // ),
    ),
  );
}
