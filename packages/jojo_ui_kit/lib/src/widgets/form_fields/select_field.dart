import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:jojo_ui_kit/src/widgets/form_fields/select_field_delegate.dart';

class UiSelectField<T> extends StatelessWidget {
  const UiSelectField({
    required this.formControl,
    required this.options,
    super.key,
    this.margin,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.focusNode,
    this.onSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.hasError = false,
    this.readOnly = false,
    this.isDense = false,
    this.showErrors = false,
    this.fillColor,
    this.autofocus = false,
    this.inputFormatters,
    this.minLines = 1,
    this.maxLines = 1,
    this.prefixIcon,
    this.onChanged,
    this.textInputAction,
    this.contentPadding,
    this.prefixText,
    this.maxLength,
    this.buildCounter,
  });

  final EdgeInsetsGeometry? margin;
  final FormControl<T> formControl;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final bool? hasError;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines;
  final int? maxLines;
  final Widget? prefixIcon;
  final void Function(T? value)? onChanged;
  final TextInputAction? textInputAction;
  final bool? showErrors;
  final bool? isDense;
  final Color? fillColor;
  final bool? autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final String? prefixText;
  final int? maxLength;
  final void Function(T? value)? onSubmitted;
  final InputCounterWidgetBuilder? buildCounter;
  final List<String> options;

  Future<void> onTap(BuildContext context, FormControl<T> control) async {
    final String? result = await showSearch<String>(
      context: context,
      delegate: SelectFieldDelegate(options),
      useRootNavigator: true,
    );

    if (result != null) {
      formControl.value = result as T;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: Insets.l),
      child: ReactiveValueListenableBuilder<T>(
        formControl: formControl,
        builder: (
          BuildContext context,
          AbstractControl<T> control,
          Widget? child,
        ) {
          final bool hasError = control.invalid && control.touched;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (labelText != null || hasError)
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: Insets.l * 0.75,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        if (labelText != null)
                          TextSpan(
                            text: labelText,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(height: 24.0 / 14),
                          ),
                        if (hasError)
                          TextSpan(
                            text: '', // ' hasError',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                  height: 24.0 / 14,
                                ),
                          ),
                      ],
                    ),
                  ),
                ),
              ReactiveTextField<T>(
                autofocus: autofocus ?? false,
                textCapitalization: textCapitalization,
                minLines: minLines,
                maxLines: maxLines,
                textInputAction: textInputAction,
                onTap: (FormControl<T> control) => onTap(context, control),
                maxLength: maxLength,
                inputFormatters: inputFormatters,
                buildCounter: buildCounter,
                onSubmitted: (FormControl<T> control) {
                  onSubmitted?.call(formControl.value);
                },
                focusNode: focusNode,
                keyboardType: keyboardType,
                obscureText: obscureText,
                formControl: formControl,
                showErrors: showErrors ?? true
                    ? null
                    : (AbstractControl<dynamic>? control) => false,
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: fillColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: contentPadding,
                  isDense: isDense,
                  prefixIcon: prefixIcon,
                  hintText: hintText, // hasError ? labelText : hintText,
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          );
        },
      ),
    );
  }
}
