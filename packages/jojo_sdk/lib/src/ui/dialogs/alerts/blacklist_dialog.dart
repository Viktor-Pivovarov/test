// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _imageHeight = 214.0;
const _imgColor = Color(0xFFEEEEEE);
const _cnvHeight = 141.0;

class BlacklistDialog extends UiDialog<bool> {
  const BlacklistDialog({
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
      closed: false,
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
        title ?? DialogI18n.blacklistedUser,
        style: context.text.bigTitle.copyWith(height: 1.2),
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
          description ?? DialogI18n.youCanUnblock,
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
