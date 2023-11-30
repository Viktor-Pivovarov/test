import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

enum UiMessageType { receive, send }

class UiMessage extends StatelessWidget {
  const UiMessage({
    super.key,
    @Deprecated('Use child') this.content,
    this.child,
    this.isTyping = false,
    this.type = UiMessageType.receive,
    this.margin = const EdgeInsets.only(bottom: Insets.l),
    this.padding = const EdgeInsets.symmetric(
      vertical: Insets.l,
      horizontal: Insets.l,
    ),
    this.expanded = false,
  });

  final String? content;
  final bool isTyping;
  final Widget? child;

  final UiMessageType type;

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  final bool expanded;

  bool get isSend => type == UiMessageType.send;

  @override
  Widget build(BuildContext context) {
    if (isTyping) {
      return Row(
        mainAxisAlignment:
            isSend ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
              color: isSend
                  ? context.colors.bg.tertiary
                  : context.colors.bg.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(!isSend ? Insets.zero : Insets.l),
                topRight: Radius.circular(isSend ? Insets.zero : Insets.l),
                bottomRight: const Radius.circular(Insets.l),
                bottomLeft: const Radius.circular(Insets.l),
              ),
            ),
            child: UIShadow.message(
              child: SpinKitThreeBounce(
                color: context.colors.text.main,
                size: 14,
              ),
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment:
          isSend ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            margin: expanded
                ? margin
                : margin?.add(
                    isSend
                        ? const EdgeInsets.only(left: Insets.xxxl)
                        : const EdgeInsets.only(right: Insets.xxxl),
                  ),
            padding: padding,
            decoration: BoxDecoration(
              color: isSend
                  ? context.colors.bg.tertiary
                  : context.colors.bg.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(!isSend ? Insets.zero : Insets.l),
                topRight: Radius.circular(isSend ? Insets.zero : Insets.l),
                bottomRight: const Radius.circular(Insets.l),
                bottomLeft: const Radius.circular(Insets.l),
              ),
            ),
            child: DefaultTextStyle(
              style: context.texts.body.base
                  .copyWith(color: context.colors.text.main),
              // textAlign: isSend ? TextAlign.end : TextAlign.start,
              child: content != null
                  ? Text(content ?? '')
                  : child ?? const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
