import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiRadioField<T> extends StatelessWidget {
  const UiRadioField({
    required this.label,
    required this.formControl,
    super.key,
    this.description,
    this.additionalLabel,
    this.padding,
    this.value,
    this.onChanged,
    this.readOnly = false,
    this.isLabelBold = false,
    this.showBorder = true,
  });

  final String label;

  final String? description;

  final EdgeInsetsGeometry? padding;

  final FormControl<T> formControl;

  final T? value;

  final bool? readOnly;

  final bool showBorder;

  final bool isLabelBold;

  final Widget? additionalLabel;

  final void Function(T? value)? onChanged;

  bool _isActive(T? controlValue) {
    return controlValue == value;
  }

  @override
  Widget build(BuildContext context) {
    // Color color = Theme.of(context).primaryColor;

    if (readOnly!) {
      // color = ThemeConfig.statusGrey;
    }

    return ReactiveValueListenableBuilder<T>(
      formControl: formControl,
      builder: (
        BuildContext context,
        AbstractControl<T> control,
        Widget? child,
      ) {
        final bool isActive = _isActive(control.value);

        return GestureDetector(
          onTap: () {
            if (!readOnly!) {
              if (onChanged == null) {
                control.value = value;
              } else {
                onChanged?.call(value);
              }
            }
          },
          child: Container(
            padding: padding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    border: Border.all(
                      color: context.color.greyLight,
                    ),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFFE6E9EB),
                        offset: Offset(0, 5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      // color: _value ? ThemeConfig.white : Colors.transparent,
                      color: isActive
                          ? Theme.of(context).radioTheme.fillColor?.resolve(
                                <MaterialState>{MaterialState.pressed},
                              ) ??
                              Colors.grey
                          : Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    //  margin: const EdgeInsets.only(top: Insets.l / 4),
                    padding: const EdgeInsets.only(bottom: Insets.s * 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                label,
                                style: context.text.smallTitle
                                    .copyWith(color: context.color.textColor),
                              ),
                            ),
                            if (additionalLabel != null) additionalLabel!,
                          ],
                        ),
                        if (description != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              description!,
                              style: context.text.smallTitle
                                  .copyWith(color: context.color.textColor),
                            ),
                          ),
                        if (showBorder) const Divider(),
                      ],
                    ),
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
