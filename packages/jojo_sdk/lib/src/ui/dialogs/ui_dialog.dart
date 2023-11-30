import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:jojo_sdk/src/ui/_ui.dart';

abstract class UiDialog<T> extends StatelessWidget {
  const UiDialog({super.key});

  Future<T?> show() {
    return DialogService.showFullscreenDialog<T>(
      dialog: this,
    );
  }

  Future<void> hide(bool? result) async {
    await DialogService.hide<bool>(
      identifier: FullScreenDialog.identifier(),
      result: result,
    );
  }
}
