import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiOnboarding extends StatelessWidget {
  const UiOnboarding({
    required this.image,
    required this.title,
    required this.description,
    required this.buttons,
    super.key,
  });

  final String image;
  final String title;
  final String description;

  final Widget buttons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: UiImage(
                        image,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Insets.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: Insets.l),
                      child: Text(
                        title,
                        style: context.text.bigTitle,
                      ),
                    ),
                    Text(
                      description,
                      style: context.text.smallTitle
                          .copyWith(color: context.color.smallTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              Insets.l,
              Insets.l,
              Insets.l,
              Insets.xxxl,
            ),
            child: buttons,
          ),
        ),
      ],
    );
  }
}
