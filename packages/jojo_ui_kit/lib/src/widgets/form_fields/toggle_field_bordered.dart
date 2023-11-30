import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@Deprecated('Use UiSegmentedButton')
class UiToggleFieldBordered<T> extends StatelessWidget {
  const UiToggleFieldBordered({
    required this.labels,
    required this.values,
    super.key,
    this.selected,
    this.onPressed,
    this.disabledColor,
    this.padding,
    this.fontSize = 16.0,
  });

  final List<String> labels;
  final List<T> values;
  final String? selected;
  final Color? disabledColor;
  final void Function(T value)? onPressed;
  final EdgeInsetsGeometry? padding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final TextExtension textExtension =
        Theme.of(context).extension<TextExtension>()!;
    final ThemeColors themeColors = Theme.of(context).extension<ThemeColors>()!;

    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.l),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(BorderRadiusInsets.xxl * 3),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 344,
            maxHeight: 48,
          ),
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BorderRadiusInsets.xxl * 3),
            border: Border.all(color: themeColors.mainAccentColor),
          ),
          child: Row(
            children: values.asMap().entries.map((MapEntry<int, T> e) {
              final bool isLast = e.key == labels.length - 1;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onPressed?.call(e.value),
                  child: Container(
                    decoration: BoxDecoration(
                      border: !isLast
                          ? Border(
                              right: BorderSide(
                                color: themeColors.mainAccentColor,
                              ),
                            )
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        labels.elementAt(e.key),
                        style: textExtension.mainTextMedium.copyWith(
                          color: themeColors.mainAccentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
