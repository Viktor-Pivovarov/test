import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@Deprecated('Use UiSegmentedButton')
class UiToggleField extends StatelessWidget {
  const UiToggleField({
    required this.values,
    required this.labels,
    super.key,
    this.selected,
    this.onPressed,
    this.disabledColor,
    this.padding,
    this.fontSize = 16.0,
    this.disabled = false,
  });

  final List<String> values;
  final List<String> labels;
  final String? selected;
  final Color? disabledColor;
  final void Function(int index)? onPressed;
  final EdgeInsetsGeometry? padding;
  final double fontSize;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Insets.l),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ToggleButtons(
            selectedColor: Colors.transparent,
            splashColor: Colors.transparent,
            color: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            fillColor: Colors.transparent,
            constraints: BoxConstraints.expand(
              width: constraints.maxWidth / values.length,
              height: constraints.maxHeight,
            ),
            renderBorder: false,
            onPressed: disabled ? null : onPressed,
            isSelected: values.map<bool>((String e) => e == selected).toList(),
            children: values.map<Widget>(
              (String e) {
                final int index = values.indexOf(e);
                final Color selectedColor = Theme.of(context).primaryColor;
                final bool isSelected = selected == values[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: Insets.l),
                  child: UIShadow(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Insets.xxxl * 5),
                        bottomLeft: Radius.circular(Insets.xxxl * 5),
                        topRight: Radius.circular(Insets.xxxl * 5),
                        bottomRight: Radius.circular(Insets.xxxl * 5),
                      ),
                    ),
                    boxShadow: (!disabled && isSelected)
                        ? _calcShadow(context, index, values.length)
                        : [],
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? disabled
                                ? context.color.disabledColor
                                : selectedColor
                            : disabledColor ?? Colors.white,
                        borderRadius: _calcBorder(index, values.length),
                      ),
                      width: double.infinity,
                      padding: padding ??
                          const EdgeInsets.symmetric(
                            vertical: Insets.l,
                            horizontal: Insets.l,
                          ),
                      child: Text(
                        labels[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: fontSize,
                              height: 1,
                              color: isSelected
                                  ? Colors.white
                                  : Theme.of(context).iconTheme.color,
                            ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }

  BorderRadius _calcBorder(int index, int length) {
    if (length <= 1) {
      return BorderRadius.circular(Insets.xxxl * 1.5);
    }

    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(Insets.xxxl * 1.5),
        bottomLeft: Radius.circular(Insets.xxxl * 1.5),
      );
    }

    if (index == length - 1) {
      return const BorderRadius.only(
        topRight: Radius.circular(Insets.xxxl * 1.5),
        bottomRight: Radius.circular(Insets.xxxl * 1.5),
      );
    }

    return BorderRadius.zero;
  }

  List<BoxShadow> _calcShadow(
    BuildContext context,
    int index,
    int length,
  ) {
    if (length <= 1) {
      return <BoxShadow>[
        BoxShadow(
          color: context.color.shadow,
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
        const BoxShadow(
          color: ThemeConfig.mainAccentShadowColor,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ];
    }

    if (index == 0) {
      return <BoxShadow>[
        BoxShadow(
          color: context.color.shadow,
          blurRadius: 20,
          offset: const Offset(10, 10),
        ),
        const BoxShadow(
          color: ThemeConfig.mainAccentShadowColor,
          blurRadius: 10,
          offset: Offset(10, 5),
        ),
      ];
    }

    if (index == length - 1) {
      return <BoxShadow>[
        BoxShadow(
          color: context.color.shadow,
          blurRadius: 20,
          offset: const Offset(-10, 10),
        ),
        const BoxShadow(
          color: ThemeConfig.mainAccentShadowColor,
          blurRadius: 10,
          offset: Offset(-10, 5),
        ),
      ];
    }
    return <BoxShadow>[
      BoxShadow(
        color: context.color.shadow,
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
      const BoxShadow(
        color: ThemeConfig.mainAccentShadowColor,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ];
  }
}
