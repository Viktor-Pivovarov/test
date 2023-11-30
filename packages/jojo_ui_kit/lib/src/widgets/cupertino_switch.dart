import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiCupertinoSwitch extends StatelessWidget {
  const UiCupertinoSwitch({
    required this.value,
    super.key,
    this.onChanged,
    this.activeColor,
    this.trackColor,
  });

  final ValueChanged<bool>? onChanged;
  final bool value;
  final Color? activeColor;
  final Color? trackColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ?? Theme.of(context).primaryColor,
      trackColor: trackColor ?? Colors.white,
    );
  }
}
