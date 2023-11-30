import 'package:flutter/cupertino.dart';

@Deprecated('TextsStyles')
abstract class TextStyles {
  /// Avenir Next Cyr
  static const TextStyle bigTitle = TextStyle(
    fontFamily: 'AvenirNextCyr',
    package: 'jojo_ui_kit',
    height: 1,
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle mainTitle = TextStyle(
    fontFamily: 'AvenirNextCyr',
    package: 'jojo_ui_kit',
    height: 32 / 24,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle mainTitleMedium = TextStyle(
    fontFamily: 'AvenirNextCyr',
    package: 'jojo_ui_kit',
    height: 32 / 24,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle smallTitle = TextStyle(
    fontFamily: 'AvenirNextCyr',
    package: 'jojo_ui_kit',
    height: 24 / 20,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle smallTitleMedium = TextStyle(
    fontFamily: 'AvenirNextCyr',
    package: 'jojo_ui_kit',
    height: 24 / 20,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  /// Montserrat
  static const TextStyle numbers = TextStyle(
    fontFamily: 'Montserrat',
    package: 'jojo_ui_kit',
    height: 40 / 24,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle mainText = TextStyle(
    fontFamily: 'Montserrat',
    package: 'jojo_ui_kit',
    height: 24 / 14,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle mainTextMedium = TextStyle(
    fontFamily: 'Montserrat',
    package: 'jojo_ui_kit',
    height: 16 / 14,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle smallText = TextStyle(
    fontFamily: 'Montserrat',
    package: 'jojo_ui_kit',
    height: 16 / 12,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle ultraSmallText = TextStyle(
    fontFamily: 'Montserrat',
    package: 'jojo_ui_kit',
    height: 16 / 10,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle chatText = TextStyle(
    fontFamily: 'Montserrat',
    package: 'jojo_ui_kit',
    height: 20 / 15,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle cap = TextStyle(
    fontFamily: 'Montserrat',
    package: 'jojo_ui_kit',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 25 / 14,
  );
}
