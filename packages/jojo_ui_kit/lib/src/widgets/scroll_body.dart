import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ScrollBody extends StatefulWidget {
  const ScrollBody({
    required this.child,
    super.key,
    this.padding,
    this.onScroll,
    this.controller,
  });

  final Widget child;
  final EdgeInsets? padding;
  final void Function(double offset)? onScroll;
  final ScrollController? controller;

  @override
  ScrollBodyState createState() => ScrollBodyState();
}

class ScrollBodyState extends State<ScrollBody> {
  late ScrollController controller;

  @override
  void initState() {
    if (widget.controller != null) {
      controller = widget.controller!;
    } else {
      controller = ScrollController();
    }

    controller.addListener(_listener);

    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_listener);

    if (widget.controller == null) {
      controller.dispose();
    }

    super.dispose();
  }

  void _listener() {
    if (widget.onScroll != null) {
      widget.onScroll?.call(controller.offset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: viewportConstraints.maxWidth,
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Padding(
              padding: widget.padding ?? const EdgeInsets.all(Insets.l),
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}
