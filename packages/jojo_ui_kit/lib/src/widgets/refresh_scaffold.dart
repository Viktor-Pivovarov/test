import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiRefreshScaffold extends StatefulWidget {
  const UiRefreshScaffold({
    required this.child,
    required this.onRefresh,
    this.appBar,
    this.useLayoutBuilder = false,
    super.key,
    this.padding,
    this.backgroundColor,
  });

  final Future<void> Function() onRefresh;

  final Widget child;

  final PreferredSizeWidget? appBar;

  final bool useLayoutBuilder;

  final EdgeInsetsGeometry? padding;

  final Color? backgroundColor;

  @override
  State<UiRefreshScaffold> createState() => _UiRefreshScaffoldState();
}

class _UiRefreshScaffoldState extends State<UiRefreshScaffold> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    if (!widget.useLayoutBuilder) {
      return Scaffold(
        backgroundColor: widget.backgroundColor,
        appBar: widget.appBar,
        body: RefreshIndicator.adaptive(
          onRefresh: widget.onRefresh,
          key: _refreshIndicatorKey,
          child: widget.child,
        ),
      );
    }

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: widget.appBar,
      body: LayoutBuilder(
        builder: (context, constraints) => RefreshIndicator.adaptive(
          onRefresh: widget.onRefresh,
          key: _refreshIndicatorKey,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: widget.padding ??
                Insets.getDefaultPageInsetsWithBottomBar(context),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight -
                    Insets.getDefaultPageInsetsWithBottomBar(context).bottom,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
