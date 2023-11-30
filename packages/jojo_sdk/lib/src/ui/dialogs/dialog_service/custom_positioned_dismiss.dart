import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';

final class CustomPositionedDismiss
    extends EasyDialogDismiss<PositionedDialog> {
  const CustomPositionedDismiss({
    required super.onDismissed,
  });

  @override
  Widget call(PositionedDialog dialog) {
    return GestureDetector(
      // onTap: () => super.handleDismiss(dialog),
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dy > 0) {
          super.handleDismiss(dialog);
        }
      },
      child: dialog.content,
    );
  }
}
