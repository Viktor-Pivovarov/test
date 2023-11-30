import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiSystemInfoDialog extends StatelessWidget {
  const UiSystemInfoDialog({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        actions: [
          IconButton(
            onPressed: () => DialogService.hide<dynamic>(
              identifier: FullScreenDialog.identifier(),
            ),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: child,
    );
  }
}
