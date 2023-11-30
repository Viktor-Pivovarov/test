import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TextsStylesDecor {
  const TextsStylesDecor();

  TextStyle get decorative => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 56,
          fontWeight: FontWeight.w500,
          height: 56 / 56,
          letterSpacing: -2.8,
        ),
      );
}

class TextsStylesHeadline {
  const TextsStylesHeadline();

  TextStyle get big => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          height: 32 / 30,
        ),
      );

  TextStyle get second => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 28 / 24,
        ),
      );
}

class TextsStylesTitle {
  const TextsStylesTitle();

  TextStyle get base => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 24 / 20,
        ),
      );

  TextStyle get light => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          height: 24 / 20,
        ),
      );
}

class TextsStylesButton {
  const TextsStylesButton();

  TextStyle get button => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 24 / 20,
        ),
      );
}

class TextsStylesBody {
  const TextsStylesBody();

  TextStyle get bigSemibold => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 24 / 17,
        ),
      );

  TextStyle get bodyLight => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          height: 24 / 17,
        ),
      );

  TextStyle get baseSemibold => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          height: 20 / 15,
        ),
      );

  TextStyle get base => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          height: 20 / 15,
        ),
      );
}

class TextsStylesFootnote {
  const TextsStylesFootnote();

  TextStyle get baseSemibold => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          height: 16 / 13,
        ),
      );

  TextStyle get base => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          height: 16 / 13,
        ),
      );
}

class TextsStylesCaption {
  const TextsStylesCaption();

  TextStyle get caption => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 16 / 12,
        ),
      );

  TextStyle get mark => GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          height: 16 / 10,
        ),
      );
}
