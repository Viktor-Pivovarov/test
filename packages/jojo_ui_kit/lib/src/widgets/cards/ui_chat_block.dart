import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChatBlock extends StatelessWidget {
  const UiChatBlock({
    required this.title,
    required this.description,
    required this.onButtonPressed,
    super.key,
  });

  final String title;
  final String description;

  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.texts.body.bigSemibold
                    .copyWith(color: context.colors.text.main),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                description,
                style: context.texts.caption.caption
                    .copyWith(color: context.colors.text.secondary),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        UiRoundButton(
          onPressed: onButtonPressed,
          icon: UiIcon(
            AssetsNew.icons.dsNavigationRight.path,
            color: context.colors.content.inverse,
          ),
        ),
      ],
    );
  }
}
