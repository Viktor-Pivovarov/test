import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiSegmentedButton<T> extends StatelessWidget {
  const UiSegmentedButton({
    required this.items,
    required this.itemBuilder,
    this.selected,
    this.onPressed,
    this.disabled = false,
    this.type = UiSegmentedButtonType.defaultType,
    this.padding = const EdgeInsets.all(Insets.l),
    super.key,
  });

  final List<T> items;

  final T? selected;

  final String Function(T item) itemBuilder;

  final void Function(int index, T item)? onPressed;

  final bool disabled;

  final UiSegmentedButtonType type;

  final EdgeInsets padding;

  bool get isOutline => type == UiSegmentedButtonType.outline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ToggleButtons(
            selectedColor: Colors.transparent,
            splashColor: Colors.transparent,
            color: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            fillColor: Colors.transparent,
            constraints: BoxConstraints.expand(
              width: constraints.maxWidth / items.length,
              height: constraints.maxHeight,
            ),
            renderBorder: false,
            onPressed: disabled
                ? null
                : (index) => onPressed?.call(index, items[index]),
            isSelected: items.map<bool>((T e) => e == selected).toList(),
            children: items.map<Widget>(
              (T e) {
                final int index = items.indexOf(e);
                final bool isSelected = selected == items[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: Insets.l),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _getBackgroundColor(isSelected, context),
                      border: Border.all(
                        color: _getColorBorder(context),
                      ),
                      borderRadius: _calcBorder(index, items.length),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: Insets.l,
                      horizontal: Insets.l,
                    ),
                    child: Text(
                      itemBuilder.call(items[index]),
                      style: context.texts.button.button.copyWith(
                        color: _getTextColor(isSelected, context),
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
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

  Color _getTextColor(bool isSelected, BuildContext context) => !isSelected
      ? disabled
          ? context.colors.button.disabled
          : context.colors.button.brand
      : context.colors.bg.secondary;

  Color _getBackgroundColor(bool isSelected, BuildContext context) => isSelected
      ? disabled
          ? context.colors.button.disabled
          : context.colors.button.brand
      : isOutline
          ? context.colors.bg.primary
          : context.colors.bg.secondary;

  Color _getColorBorder(BuildContext context) => isOutline
      ? disabled
          ? context.colors.button.disabled
          : context.colors.button.brand
      : Colors.transparent;

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
}

enum UiSegmentedButtonType { defaultType, outline }
