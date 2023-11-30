import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiCandidateProfileModel {
  UiCandidateProfileModel({required this.icon, required this.text});

  final String icon;
  final String text;
}

class UiCandidateProfile extends StatelessWidget {
  const UiCandidateProfile({
    required this.title,
    required this.items,
    super.key,
  });

  final String title;
  final List<UiCandidateProfileModel> items;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.l),
            child: Text(
              title,
              style: context.text.smallTitle,
            ),
          ),
          Wrap(
            spacing: Insets.xs,
            runSpacing: Insets.xs,
            children: items
                .map(
                  (e) => Chip(
                    visualDensity: VisualDensity.compact,
                    side: BorderSide(
                      color: context.color.smallTextColor,
                    ),
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.all(Insets.s),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: Insets.s),
                          child: UiIcon(e.icon),
                        ),
                        Text(
                          e.text,
                          style: context.text.mainTextMedium
                              .copyWith(color: context.color.smallTextColor),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
