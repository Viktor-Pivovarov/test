import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class DualButton extends StatelessWidget {
  const DualButton({
    required this.textLeft,
    required this.textRight,
    super.key,
    this.onTapLeft,
    this.onTapRight,
  });

  final VoidCallback? onTapLeft;
  final VoidCallback? onTapRight;
  final String textLeft;
  final String textRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            onPressed: onTapLeft,
            padding: const EdgeInsets.symmetric(
              vertical: Insets.l,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Insets.l * 15),
                bottomLeft: Radius.circular(Insets.l * 15),
              ),
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
            child: Text(
              textLeft,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                    height: 1,
                  ),
            ),
          ),
        ),
        Expanded(
          child: MaterialButton(
            onPressed: onTapRight,
            padding: const EdgeInsets.symmetric(vertical: Insets.l),
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(Insets.l * 15),
                bottomRight: Radius.circular(Insets.l * 15),
              ),
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
            child: Text(
              textRight,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                    height: 1,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
