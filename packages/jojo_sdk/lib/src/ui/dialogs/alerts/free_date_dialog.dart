// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class FreeDateDialog extends UiDialog<bool> {
  const FreeDateDialog({
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
    return OneButtonDialog(
      image: Stack(
        alignment: Alignment.center,
        children: [
          UiImage(
            Assets.images.bonus,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
      title: Text(
        title ?? DialogI18n.freeDate,
        style: context.text.bigTitle,
        textAlign: TextAlign.center,
      ),
      description: Padding(
        padding: const EdgeInsets.only(
          top: Insets.s,
          bottom: Insets.xxl,
          left: Insets.xxl,
          right: Insets.xxl,
        ),
        child: Text(
          description ?? DialogI18n.youCanActivate,
          style: context.text.mainText,
          textAlign: TextAlign.center,
        ),
      ),
      button: UiButton.dialog(
        padding: EdgeInsets.zero,
        text: btnTitle ?? DialogI18n.activate,
        onPressed: () => hide(true),
      ),
    );
  }
}
