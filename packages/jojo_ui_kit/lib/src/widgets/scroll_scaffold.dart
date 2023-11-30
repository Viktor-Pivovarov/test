import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class UiScrollScaffold extends StatefulWidget {
  const UiScrollScaffold({
    required this.stateStream,
    required this.onRefresh,
    super.key,
    this.currentKey,
    this.appBar,
    this.bottomNavigationBar,
    this.onDrawerChanged,
    this.backgroundColor,
    this.padding,
    this.controller,
    this.children,
    this.onScroll,
    this.layoutBuilder,
  });

  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final DrawerCallback? onDrawerChanged;
  final Key? currentKey;
  final Color? backgroundColor;
  final ScrollController? controller;

  final EdgeInsets? padding;

  final List<Widget>? children;

  final void Function(double offset)? onScroll;

  final Stream<SwipeRefreshState> stateStream;

  final VoidCallback onRefresh;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
    Widget child,
  )? layoutBuilder;

  @override
  State<UiScrollScaffold> createState() => _UiScrollScaffoldState();
}

class _UiScrollScaffoldState extends State<UiScrollScaffold> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? ScrollController();

    _controller.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    widget.onScroll?.call(_controller.offset);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).padding.bottom;

    if (padding > 0) {
      padding = Insets.xxl + Insets.s;
    } else {
      padding = Insets.bottomNavBar;
    }

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: widget.appBar,
      key: widget.currentKey,
      onDrawerChanged: widget.onDrawerChanged,
      body: widget.layoutBuilder != null
          ? LayoutBuilder(
              builder: (context, constraints) {
                return widget.layoutBuilder!(
                  context,
                  constraints,
                  SwipeRefresh.adaptive(
                    padding: widget.padding,
                    stateStream: widget.stateStream,
                    onRefresh: widget.onRefresh,
                    scrollController: _controller,
                    children: widget.children,
                  ),
                );
              },
            )
          : SwipeRefresh.adaptive(
              padding: widget.padding,
              stateStream: widget.stateStream,
              onRefresh: widget.onRefresh,
              scrollController: _controller,
              children: widget.children,
            ),
    );
  }
}
