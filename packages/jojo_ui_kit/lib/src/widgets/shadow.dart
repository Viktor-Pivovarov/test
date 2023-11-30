import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UIShadow extends StatelessWidget {
  const UIShadow({
    required this.child,
    this.decoration = const BoxDecoration(),
    this.boxShadow = const <BoxShadow>[
      BoxShadow(
        color: Color.fromARGB(25, 115, 145, 166),
        blurRadius: 5,
        spreadRadius: 5,
      ),
    ],
    super.key,
  });

  const UIShadow.textField({
    required this.child,
    this.decoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(48)),
    ),
    this.boxShadow = const <BoxShadow>[
      BoxShadow(
        color: Color.fromARGB(25, 115, 145, 166),
        blurRadius: 5,
        offset: Offset(0, 5),
        spreadRadius: 3,
      ),
    ],
    super.key,
  });

  const UIShadow.button({
    required this.child,
    this.decoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(96)),
    ),
    this.boxShadow = const <BoxShadow>[
      BoxShadow(
        color: ThemeConfig.mainAccentShadowColor,
        blurRadius: 7,
        offset: Offset(0, 5),
        spreadRadius: 1,
      ),
    ],
    super.key,
  });

  const UIShadow.message({
    required this.child,
    this.decoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    this.boxShadow = const <BoxShadow>[
      BoxShadow(
        color: ThemeConfig.shadow,
        blurRadius: 20,
        offset: Offset(0, 10),
      ),
    ],
    super.key,
  });

  final Widget child;

  final BoxDecoration decoration;

  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration.copyWith(boxShadow: boxShadow),
      child: child,
    );
  }
}
