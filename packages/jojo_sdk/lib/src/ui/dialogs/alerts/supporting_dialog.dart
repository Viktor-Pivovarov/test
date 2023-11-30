import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _imgHeight = 152.0;

class SupportingDialog extends UiDialog<bool> {
  const SupportingDialog({
    this.title,
    this.description,
    this.btnTitle,
    super.key,
  });

  final String? title;
  final String? description;
  final String? btnTitle;

  @override
  Widget build(BuildContext context) {
    final TextExtension textExtension =
        Theme.of(context).extension<TextExtension>()!;

    return OneButtonDialog(
      image: UiImage(
        Assets.images.request,
        height: _imgHeight,
        fit: BoxFit.cover,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: Insets.xl),
        child: Text(
          title ?? DialogI18n.thankYou,
          style: textExtension.bigTitle.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      description: Padding(
        padding: const EdgeInsets.only(
          left: Insets.xxl,
          right: Insets.xxl,
          top: Insets.s,
          bottom: Insets.xxl,
        ),
        child: Text(
          description ?? DialogI18n.weWillReply,
          style: textExtension.mainText,
          textAlign: TextAlign.center,
        ),
      ),
      button: UiButton.dialog(
        padding: EdgeInsets.zero,
        text: btnTitle ?? DialogI18n.iUnderstand,
        onPressed: () => hide(true),
      ),
    );
  }
}
