import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiEditableMessage extends StatelessWidget {
  const UiEditableMessage({
    super.key,
    this.child,
    this.editLabel = 'Ред.',
    this.padding = const EdgeInsets.only(
      left: Insets.xl,
      top: Insets.s,
      right: Insets.s,
    ),
    this.onPressedEdit,
  });

  final Widget? child;

  final String? editLabel;

  final VoidCallback? onPressedEdit;

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return UIShadow(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: context.color.shadow,
          offset: const Offset(0, 10),
          blurRadius: 20,
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          color: context.color.chatBgLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Insets.s),
            bottomLeft: Radius.circular(Insets.s),
            bottomRight: Radius.circular(Insets.s),
          ),
        ),
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              child ?? const SizedBox.shrink(),
              Visibility(
                visible: onPressedEdit != null,
                child: GestureDetector(
                  onTap: onPressedEdit,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: Insets.s),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          editLabel ?? '',
                          style: context.text.smallText.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context.color.mainAccentColor,
                          ),
                        ),
                        Icon(
                          Icons.edit_outlined,
                          size: 14,
                          color: context.color.mainAccentColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UiEditableMessageSummary extends StatelessWidget {
  const UiEditableMessageSummary({
    this.title,
    this.content,
    this.onPressedEdit,
    this.editLabel = 'Ред.',
    this.child,
    super.key,
  });

  final String? title;
  final String? content;
  final VoidCallback? onPressedEdit;
  final String? editLabel;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Text(
            title ?? '',
            textAlign: TextAlign.end,
            style: context.text.mainTextMedium.copyWith(height: 24 / 14),
          ),
        if (content != null)
          Text(
            content ?? '',
            textAlign: TextAlign.end,
            style: context.text.mainTextMedium
                .copyWith(fontSize: 20, height: 24 / 20),
          ),
        if (child != null) child!,
        Visibility(
          visible: onPressedEdit != null,
          child: GestureDetector(
            onTap: onPressedEdit,
            child: Padding(
              padding: const EdgeInsets.only(bottom: Insets.s),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    editLabel ?? '',
                    style: context.text.smallText.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.color.mainAccentColor,
                    ),
                  ),
                  Icon(
                    Icons.edit_outlined,
                    size: 14,
                    color: context.color.mainAccentColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
