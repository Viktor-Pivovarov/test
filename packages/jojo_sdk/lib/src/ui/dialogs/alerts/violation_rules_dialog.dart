// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _imageHeight = 180.0;

class ViolationRulesDialog extends UiDialog<bool> {
  const ViolationRulesDialog({
    this.btnTitle,
    this.onTapRules,
    this.onTapSupport,
    super.key,
  });

  final String? btnTitle;

  final VoidCallback? onTapRules;
  final VoidCallback? onTapSupport;

  @override
  Widget build(BuildContext context) {
    return OneButtonDialog(
      closed: false,
      image: UiImage(
        Assets.images.failed,
        fit: BoxFit.fitHeight,
        height: _imageHeight,
      ),
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '${DialogI18n.photoViolation} ',
          style: context.text.bigTitle
              .copyWith(color: Colors.black, fontSize: Insets.xl),
          children: [
            TextSpan(
              text: DialogI18n.rulesJoJo,
              style: context.text.bigTitle.copyWith(
                color: Colors.black,
                fontSize: Insets.xl,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => onTapRules?.call(),
            ),
          ],
        ),
      ),
      description: Padding(
        padding: const EdgeInsets.only(
          top: Insets.l,
          bottom: Insets.xxl,
          left: Insets.l,
          right: Insets.l,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DialogI18n.readOurPolicies,
              style: context.text.mainText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Insets.s,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '${DialogI18n.ifYouThink} ',
                style: context.text.mainText,
                children: [
                  TextSpan(
                    text: DialogI18n.ourSupportTeam,
                    style: context.text.mainText.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => onTapSupport?.call(),
                  ),
                ],
              ),
            ),
          ],
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
