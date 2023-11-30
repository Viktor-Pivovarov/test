import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/core/_core.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class SelectionModerationScreen extends StatelessWidget {
  const SelectionModerationScreen({
    required this.timer,
    required this.onRefresh,
    super.key,
    this.onPressed,
    this.onFinishTimer,
    this.onPressedFilter,
  });

  final Duration timer;

  final VoidCallback? onPressedFilter;

  final VoidCallback? onPressed;

  final VoidCallback? onFinishTimer;

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return UiRefreshScaffold(
      onRefresh: onRefresh,
      useLayoutBuilder: true,
      appBar: UiAppBar(
        title: Text(SelectionI18n.moderationTitle),
        actions: [
          IconButton(
            onPressed: onPressedFilter,
            icon: UiIcon(Assets.icons.iFilter),
          ),
        ],
      ),
      child: UiSelectionModerationCard(
        timer: timer,
        onPressed: onPressed,
        onFinishTimer: onFinishTimer,
      ),
    );
  }
}
