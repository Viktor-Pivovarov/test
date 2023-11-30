import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiCheckboxField<T> extends StatelessWidget {
  const UiCheckboxField({
    required this.formControl,
    super.key,
    this.label,
    this.customLabel,
    this.description,
    this.padding,
    this.values,
    this.onChanged,
    this.readOnly = false,
    this.showBorder = true,
  });

  final String? label;

  final Widget? customLabel;

  final String? description;

  final EdgeInsetsGeometry? padding;

  final FormControl<T> formControl;

  final List<T>? values;

  final bool showBorder;

  final void Function(T? value)? onChanged;

  final bool? readOnly;

  List<T> _values(T? value) {
    if (values != null) {
      return values!;
    }

    return <T>[false as T, true as T];
  }

  bool _isActive(T? value) {
    return _values(value).last == value;
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<T>(
      formControl: formControl,
      builder: (
        BuildContext context,
        AbstractControl<T> control,
        Widget? child,
      ) {
        final List<T> localValues = _values(control.value);
        final bool value = _isActive(control.value);

        // Color primaryColor = Theme.of(context).primaryColor;

        if (readOnly!) {
          // primaryColor = ThemeConfig.statusGrey;
        }

        return GestureDetector(
          onTap: () {
            if (readOnly!) {
              return;
            }

            if (onChanged == null) {
              if (control.value == null) {
                control.value = localValues.last;
              } else {
                control.value = localValues.first == control.value
                    ? localValues.last
                    : localValues.first;
              }
            } else {
              onChanged?.call(control.value);
            }
          },
          child: Container(
            color: Colors.transparent,
            padding: padding ??
                const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.color.middleGray,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.check,
                    color: value ? context.color.green : Colors.transparent,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (label != null)
                        Text(label!, style: context.text.smallTitle),
                      if (customLabel != null) customLabel!,
                      if (description != null)
                        Text(description!, style: context.text.mainText),
                      if (showBorder) const Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
