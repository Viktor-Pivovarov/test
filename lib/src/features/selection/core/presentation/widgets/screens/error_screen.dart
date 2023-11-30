import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/core/_core.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class SelectionErrorScreen extends StatelessWidget {
  const SelectionErrorScreen({
    required this.onRefresh,
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return UiRefreshScaffold(
      onRefresh: onRefresh,
      useLayoutBuilder: true,
      appBar: UiAppBar(title: Text(SelectionI18n.error)),
      child: UiSelectionRejectModerationCard(onPressed: onPressed),
    );
  }
}
