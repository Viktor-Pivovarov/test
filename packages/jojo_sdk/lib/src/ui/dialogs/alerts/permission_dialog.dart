// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _titleLineHeight = 1.2;

class PermissionDialog extends UiDialog<bool> {
  const PermissionDialog({
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
      image: UiImage(
        Assets.images.failed,
      ),
      title: Text(
        title ?? DialogI18n.giveAccessMediaLibrary,
        style: context.text.bigTitle
            .copyWith(height: _titleLineHeight, color: Colors.black),
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
          description ?? DialogI18n.toUploadAdditionalPhotos,
          style: context.text.mainText,
          textAlign: TextAlign.center,
        ),
      ),
      button: UiButton.dialog(
        padding: EdgeInsets.zero,
        text: DialogI18n.toSettings,
        onPressed: () => hide(true),
      ),
    );
  }
}
