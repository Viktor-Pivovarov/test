import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class OneButtonDialog extends UiDialog<bool> {
  const OneButtonDialog({
    required this.image,
    required this.title,
    required this.description,
    required this.button,
    this.closed = true,
    super.key,
  });

  final Widget image;
  final Widget title;
  final Widget description;

  final UiButton button;

  final bool closed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.l),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Insets.l,
          vertical: Insets.m,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Insets.l),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: closed,
                  child: InkWell(
                    child: UiIcon(Assets.icons.iCross),
                    onTap: () => hide(false),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: Insets.l),
                    child: image,
                  ),
                ),
              ],
            ),
            DefaultTextStyle(
              style: context.text.bigTitle,
              textAlign: TextAlign.center,
              child: title,
            ),
            DefaultTextStyle(
              style: context.text.mainText,
              textAlign: TextAlign.center,
              child: description,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.s),
              child: button,
            ),
            const SizedBox(
              height: Insets.m,
            ),
          ],
        ),
      ),
    );
  }
}
