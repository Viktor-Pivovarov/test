import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _vectorColor = Color(0xFFF4E9E6);
const _imageHeight = 174.0;

class UpdateDialog extends UiDialog<bool> {
  const UpdateDialog({
    this.title,
    this.description,
    this.btnTitle,
    this.isFullScreen = false,
    super.key,
  });

  final String? title;
  final String? description;
  final String? btnTitle;

  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    if (isFullScreen) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  UiIcon(
                    Assets.icons.updateVector,
                    color: _vectorColor,
                  ),
                  UiImage(
                    Assets.images.update,
                    fit: BoxFit.fitHeight,
                    height: _imageHeight,
                  ),
                ],
              ),
              Text(
                title ?? DialogI18n.updateAvailable,
                style: context.text.bigTitle
                    .copyWith(color: context.color.textColor),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: Insets.s,
                  bottom: Insets.xl,
                  left: Insets.xxl,
                  right: Insets.xxl,
                ),
                child: Text(
                  description ?? DialogI18n.weAddedNewFeatures,
                  style: context.text.mainText,
                  textAlign: TextAlign.center,
                ),
              ),
              UiButton.dialog(
                padding: EdgeInsets.zero,
                text: btnTitle ?? DialogI18n.update,
                onPressed: () => hide(true),
              ),
            ],
          ),
        ),
      );
    }
    return OneButtonDialog(
      image: Stack(
        alignment: Alignment.center,
        children: [
          UiIcon(
            Assets.icons.updateVector,
            color: _vectorColor,
          ),
          UiImage(
            Assets.images.update,
            fit: BoxFit.fitHeight,
            height: _imageHeight,
          ),
        ],
      ),
      title: Text(
        title ?? DialogI18n.updateAvailable,
        style: context.text.bigTitle.copyWith(color: context.color.textColor),
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
          description ?? DialogI18n.weAddedNewFeatures,
          style: context.text.mainText,
          textAlign: TextAlign.center,
        ),
      ),
      button: UiButton.dialog(
        padding: EdgeInsets.zero,
        text: btnTitle ?? DialogI18n.update,
        onPressed: () => hide(true),
      ),
    );
  }
}
