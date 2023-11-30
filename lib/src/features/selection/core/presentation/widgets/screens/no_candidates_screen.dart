import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/core/_core.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class SelectionNoCandidatesScreen extends StatelessWidget {
  const SelectionNoCandidatesScreen({
    required this.onRefresh,
    super.key,
    this.onPressedFilter,
    this.onPressedAlgorithm,
  });

  final VoidCallback? onPressedFilter;

  final VoidCallback? onPressedAlgorithm;

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return UiRefreshScaffold(
      onRefresh: onRefresh,
      useLayoutBuilder: true,
      appBar: UiAppBar(
        title: Text(SelectionI18n.searchingTitle),
        actions: [
          IconButton(
            onPressed: onPressedFilter,
            icon: UiIcon(Assets.icons.iFilter),
          ),
        ],
      ),
      child: UiSelectionNoOffersCard(onPressed: onPressedAlgorithm),
    );
  }
}
