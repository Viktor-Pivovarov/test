// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _imageHeight = 214.0;
const _imgColor = Color(0xFFffe8ec);

class AccountDeletedDialog extends UiDialog<bool> {
  const AccountDeletedDialog({
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
            Assets.icons.deleteVector,
            color: _imgColor,
          ),
          UiImage(
            Assets.images.delete,
            fit: BoxFit.fitHeight,
            height: _imageHeight,
          ),
        ],
      ),
      title: Text(
        title ?? DialogI18n.accountDeleted,
        style: context.text.bigTitle.copyWith(color: context.color.textColor),
        textAlign: TextAlign.center,
      ),
      description: Padding(
        padding: const EdgeInsets.only(
          top: Insets.s,
          bottom: Insets.xxl,
          left: Insets.xxxl,
          right: Insets.xxxl,
        ),
        child: Text(
          description ?? DialogI18n.gladToSee,
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
