import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiContact extends StatelessWidget {
  const UiContact({
    required this.label,
    required this.field,
    required this.icon,
    required this.iconColor,
    super.key,
    this.suffixIcon,
    this.showBorder = true,
    this.isEdit = false,
  });

  final String icon;
  final Color iconColor;

  final String label;
  final Widget field;
  final Widget? suffixIcon;

  final bool showBorder;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: Insets.l),
      // color: Colors.red,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 44,
            height: 44,
            margin: const EdgeInsets.only(right: Insets.l),
            padding: const EdgeInsets.all(Insets.s * 1.5),
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(96),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                  color: iconColor.withOpacity(0.3),
                ),
              ],
            ),
            child: CrossImage(
              icon,
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: showBorder
                        ? Theme.of(context).dividerColor
                        : Colors.transparent,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: Insets.s / 2),
                          child: Text(
                            label,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        field,
                      ],
                    ),
                  ),
                  if (suffixIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: Insets.s),
                      child: suffixIcon,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
