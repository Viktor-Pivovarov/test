// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _imageHeight = 240.0;
const _imgColor = Color(0xFFffe8ec);
const _cnvHeight = 141.0;

class LogoutDialog extends UiDialog<bool> {
  const LogoutDialog({
    this.title,
    this.description,
    this.btnOkTitle,
    this.btnCancelTitle,
    super.key,
  });

  final String? title;
  final String? description;
  final String? btnOkTitle;
  final String? btnCancelTitle;

  @override
  Widget build(BuildContext context) {
    return TwoButtonDialog(
      closed: false,
      image: Stack(
        alignment: Alignment.center,
        children: [
          UiIcon(
            Assets.icons.moderationVector,
            height: _cnvHeight,
            color: _imgColor,
          ),
          UiImage(
            Assets.images.failed,
            fit: BoxFit.fitHeight,
            height: _imageHeight,
          ),
        ],
      ),
      title: Text(
        title ?? DialogI18n.logoutConfirm,
        style: context.text.bigTitle,
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
          description ?? '',
          style: context.text.mainText,
          textAlign: TextAlign.center,
        ),
      ),
      leftButton: UiButton.dialog(
        padding: EdgeInsets.zero,
        text: btnCancelTitle ?? DialogI18n.cancel,
        onPressed: () => hide(false),
      ),
      rightButton: UiButton.dialog(
        padding: EdgeInsets.zero,
        text: btnOkTitle ?? DialogI18n.ok,
        onPressed: () => hide(true),
      ),
    );
  }
}
