import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';

final class CustomPositionedShell extends PositionedShell {
  const CustomPositionedShell();

  @override
  Widget call(PositionedDialog dialog) {
    return SizedBox(
      width: double.infinity,
      child: dialog.content,
    );
  }
}
