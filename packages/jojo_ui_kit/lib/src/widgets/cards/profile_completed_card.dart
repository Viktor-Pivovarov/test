import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiProfileCompletedCard extends StatelessWidget {
  const UiProfileCompletedCard({
    this.label = '',
    this.hint = '',
    this.percent = 100,
    super.key,
    this.onPressed,
    this.useShadow = true,
  });

  final String label;
  final String hint;
  final int percent;

  final bool useShadow;

  final VoidCallback? onPressed;

  EdgeInsetsGeometry get _margin => const EdgeInsets.only(bottom: Insets.l);

  EdgeInsetsGeometry get _padding =>
      const EdgeInsets.symmetric(horizontal: Insets.xl, vertical: Insets.m);

  BorderRadius get _borderRadius => BorderRadius.circular(Insets.l);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.bg.secondary,
        boxShadow: useShadow
            ? <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).cardTheme.shadowColor ??
                      const Color.fromRGBO(115, 145, 166, 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : <BoxShadow>[],
        borderRadius: _borderRadius,
      ),
      margin: _margin,
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Insets.l),
        ),
        color: Theme.of(context).cardTheme.color,
        child: InkWell(
          splashColor:
              Theme.of(context).cardTheme.shadowColor?.withOpacity(0.1),
          highlightColor:
              Theme.of(context).cardTheme.shadowColor?.withOpacity(0.1),
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Padding(
            padding: _padding,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      label,
                      style: context.texts.title.base,
                    ),
                    Expanded(
                      child: Text(
                        '$percent%',
                        style: context.texts.title.base,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Insets.s),
                UiLinearIndicator(percent: percent),
                const SizedBox(height: Insets.s),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        hint,
                        style: context.texts.body.base
                            .copyWith(color: context.colors.text.link),
                      ),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
