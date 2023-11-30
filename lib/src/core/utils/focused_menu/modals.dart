import 'package:flutter/material.dart';

class FocusedMenuItem {
  FocusedMenuItem({
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.trailingIcon,
  });
  Color? backgroundColor;
  Widget title;
  Icon? trailingIcon;
  Function onPressed;
}
