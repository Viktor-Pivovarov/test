import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ActiveChatEmpty extends StatelessWidget {
  const ActiveChatEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        // color: context.colors.bg.secondary,
        color: context.colors.bg.brand,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UiImage(
            AssetsNew.images.emptyStates.rest.path,
            width: context.mediaSize.width,
            height: 200,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: Insets.s),
              child: Text(
                ChatI18n.startChatTitle,
                style: context.texts.headline.second
                    .copyWith(color: context.colors.text.main),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.l),
              child: Text(
                ChatI18n.startChatDesc,
                style: context.texts.body.base
                    .copyWith(color: context.colors.text.main),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
