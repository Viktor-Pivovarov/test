import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _imageHeight = 174.0;
const _deg15 = -15 * math.pi / 180;

class BalanceDialog extends UiDialog<bool> {
  const BalanceDialog({
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
            Assets.icons.tarifVector,
            color: context.color.mainAccentColor,
          ),
          Transform.rotate(
            angle: _deg15,
            child: UiImage(
              Assets.images.wallet,
              fit: BoxFit.fitHeight,
              height: _imageHeight,
            ),
          ),
        ],
      ),
      title: Text(
        title ?? DialogI18n.topUpBalance,
        style: context.text.bigTitle.copyWith(fontSize: Insets.xl),
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
          description ?? DialogI18n.zeroBalance,
          style: context.text.mainText,
          textAlign: TextAlign.center,
        ),
      ),
      button: UiButton.dialog(
        padding: EdgeInsets.zero,
        text: btnTitle ?? DialogI18n.rates,
        onPressed: () => hide(true),
      ),
    );
  }
}
