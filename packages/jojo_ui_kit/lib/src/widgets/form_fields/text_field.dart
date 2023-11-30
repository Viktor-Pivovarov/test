import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:jojo_ui_kit/src/widgets/form_fields/form_errors.dart';

class UiTextField<T> extends StatelessWidget {
  const UiTextField({
    required this.formControl,
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
    this.disabled = false,
    this.isDense = false,
    this.showErrors = false,
    this.fillColor,
    this.autofocus = false,
    this.inputFormatters,
    this.onTap,
    this.minLines = 1,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.textInputAction,
    this.contentPadding,
    this.prefixText,
    this.maxLength,
    this.buildCounter,
    this.useShadow = true,
    this.validationMessages,
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
  final bool readOnly;
  final bool disabled;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(FormControl<T> control)? onTap;
  final int? minLines;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ReactiveFormFieldCallback<T>? onChanged;
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
  final bool useShadow;
  final Map<String, String Function(Object)>? validationMessages;

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
              if (labelText != null || (hasError && (showErrors ?? false)))
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
                            style: context.text.cap
                                .copyWith(color: context.color.smallTextColor),
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
              if (useShadow && !disabled)
                UIShadow.textField(child: _buildTextField(context))
              else
                _buildTextField(context),
            ],
          );
        },
      ),
    );
  }

  ReactiveTextField<T> _buildTextField(BuildContext context) {
    return ReactiveTextField<T>(
      autofocus: autofocus ?? false,
      textCapitalization: textCapitalization,
      minLines: minLines,
      maxLines: maxLines,
      textInputAction: textInputAction,
      onTap: disabled ? null : onTap,
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
      showErrors: showErrors ?? false
          ? (AbstractControl<dynamic>? control) =>
              control?.errors.isNotEmpty ?? false
          : null,
      readOnly: readOnly,
      onChanged: onChanged,
      validationMessages: validationMessages ?? ReactiveErrors.errorMethods,
      decoration: InputDecoration(
        fillColor: disabled ? context.color.disabledColor : fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: BorderSide.none,
        ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(48.0),
        //   borderSide: BorderSide(color: Colors.red),
        // ),
        contentPadding: contentPadding,
        isDense: isDense,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: context.text.smallTitle
            .copyWith(color: context.color.smallTextColor),
        hintText: hintText, // hasError ? labelText : hintText,
      ),
      style: disabled
          ? context.text.smallTitle
              .copyWith(color: Theme.of(context).disabledColor)
          : context.text.smallTitle,
    );
  }
}
