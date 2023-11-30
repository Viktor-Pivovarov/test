import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class MenuSupportProblemCard extends StatelessWidget {
  const MenuSupportProblemCard({
    super.key,
    this.onPressed,
    this.title = '',
    this.label = '',
  });

  final VoidCallback? onPressed;

  final String title;
  final String label;

  EdgeInsetsGeometry get _padding => const EdgeInsets.only(
        top: Insets.l,
        bottom: Insets.s,
        left: Insets.xl,
        right: Insets.xl,
      );

  BorderRadius get _borderRadius => BorderRadius.circular(Insets.l);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).cardTheme.shadowColor ??
                const Color.fromRGBO(115, 145, 166, 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: _borderRadius,
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Insets.l),
        ),
        color: Theme.of(context).cardTheme.color,
        child: Padding(
          padding: _padding,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.text.smallTitleMedium,
                    ),
                    const SizedBox(
                      height: Insets.s,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 152,
                height: 60,
                child: UiButton(
                  fullWidth: false,
                  text: label,
                  onPressed: onPressed,
                  textStyle: context.text.smallTitle.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
