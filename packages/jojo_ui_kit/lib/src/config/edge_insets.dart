import 'package:flutter/widgets.dart';

class Insets {
  static const double zero = 0;
  static const double xxs = 2;
  static const double xs = 4;
  static const double s = 8;
  static const double m = 12;
  static const double l = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 64;
  static const double xxxxl = 96;
  static const double bottomNavBar = 88;

  static EdgeInsets defaultPageInsetsWithBottomBar = const EdgeInsets.fromLTRB(
    Insets.l,
    Insets.l,
    Insets.l,
    Insets.bottomNavBar,
  );

  static EdgeInsets getDefaultPageInsetsWithBottomBar(BuildContext context) {
    // final double padding = MediaQuery.of(context).padding.bottom;

    // if (padding > 0) {
    //   padding = Insets.bottomNavBar;
    // } else {
    //   padding = Insets.bottomNavBar;
    // }

    return const EdgeInsets.fromLTRB(
      Insets.l,
      Insets.l,
      Insets.l,

      // Insets.bottomNavBar + Insets.xs,
      Insets.bottomNavBar + Insets.xs,
    );
  }
}

class BorderRadiusInsets {
  static const double small = 8;
  static const double large = 32;

  static const double xxs = 2;
  static const double xs = 4;
  static const double s = 8;
  static const double m = 12;
  static const double l = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 64;
}
