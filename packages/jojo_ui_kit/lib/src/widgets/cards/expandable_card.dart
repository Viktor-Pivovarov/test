import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiExpandableCard extends StatelessWidget {
  const UiExpandableCard({
    required this.title,
    this.child,
    this.bodyBuilder,
    this.margin,
    this.description,
    this.prefixIcon,
    this.iconColor,
    super.key,
    this.initialExpanded = false,
  });

  final Widget title;
  final Widget? description;
  final Widget? prefixIcon;
  final Widget? child;
  final Widget Function(BuildContext context, bool isExpanded)? bodyBuilder;
  final EdgeInsetsGeometry? margin;
  final bool initialExpanded;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ExpandableNotifier(
        initialExpanded: initialExpanded,
        child: Builder(
          builder: (BuildContext context) {
            final ExpandableController? controller =
                ExpandableController.of(context);
            final bool isExpanded = controller?.expanded ?? initialExpanded;
            const Radius borderRadius = Radius.circular(BorderRadiusInsets.s);

            return Padding(
              padding: const EdgeInsets.only(bottom: Insets.l),
              child: ExpandablePanel(
                header: UiCard(
                  margin: EdgeInsets.zero,
                  borderRadius: BorderRadius.only(
                    topLeft: borderRadius,
                    topRight: borderRadius,
                    bottomLeft: isExpanded ? Radius.zero : borderRadius,
                    bottomRight: isExpanded ? Radius.zero : borderRadius,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            if (prefixIcon != null)
                              Padding(
                                padding: const EdgeInsets.only(right: Insets.s),
                                child: prefixIcon,
                              ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: title),
                                      const SizedBox(
                                        width: Insets.xxl,
                                      ),
                                      Transform.rotate(
                                        angle: isExpanded ? pi : 2 * pi,
                                        child: CrossPlatformSvg.asset(
                                          Assets.icons.iChevronDown,
                                          color: iconColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (description != null) description!,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                theme: const ExpandableThemeData(hasIcon: false),
                expanded: UiCard(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: borderRadius,
                    bottomRight: borderRadius,
                  ),
                  margin: EdgeInsets.zero,
                  padding: const EdgeInsets.only(
                    bottom: Insets.l,
                    left: Insets.l,
                    right: Insets.l,
                  ),
                  child: bodyBuilder != null
                      ? Builder(
                          builder: (BuildContext context) {
                            return bodyBuilder!(context, isExpanded);
                          },
                        )
                      : child,
                ),
                collapsed: Container(),
              ),
            );
          },
        ),
      ),
    );
  }
}
