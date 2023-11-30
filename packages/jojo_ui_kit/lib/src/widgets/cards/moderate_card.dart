import 'package:flutter/material.dart';

class UiModerateCard extends StatelessWidget {
  const UiModerateCard({
    required this.title,
    required this.text,
    super.key,
    this.onPressed,
  });

  final String title;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container();
    // TODO deprecated
    // return UiCard(
    //   title: title,
    //   text: text,
    //   onPressed: onPressed,
    //   suffixIcon: CrossPlatformSvg.asset(
    //     Assets.icons.arrowDown,
    //     color: Theme.of(context).primaryColor,
    //   ),
    // );
  }
}
