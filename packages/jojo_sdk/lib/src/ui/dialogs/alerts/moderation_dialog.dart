// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _imageHeight = 240.0;
const _imgColor = Color(0xFFEEEEEE);
const _cnvHeight = 141.0;
const _titleLineHeight = 1.2;

class ModerationDialog extends UiDialog<bool> {
  const ModerationDialog({
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
          UiIcon(
            Assets.icons.moderationVector,
            color: _imgColor,
            height: _cnvHeight,
          ),
          UiImage(
            Assets.images.failed,
            fit: BoxFit.fitHeight,
            height: _imageHeight,
          ),
        ],
      ),
      title: Text(
        title ?? DialogI18n.notModerated,
        style: context.text.bigTitle.copyWith(height: _titleLineHeight),
        textAlign: TextAlign.center,
      ),
      description: Padding(
        padding: const EdgeInsets.only(
          top: Insets.s,
          bottom: Insets.xl,
          left: Insets.xxl,
          right: Insets.xxl,
        ),
        child: Text(
          description ?? DialogI18n.contactSupport,
          style: context.text.mainText,
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
