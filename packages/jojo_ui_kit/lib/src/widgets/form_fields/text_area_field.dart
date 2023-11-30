import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiTextAreaField extends StatelessWidget {
  const UiTextAreaField({
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
    this.isDense = false,
    this.showErrors = false,
    this.fillColor,
    this.autofocus = false,
    this.inputFormatters,
    this.onTap,
    this.minLines = 1,
    this.maxLines = 100,
    this.prefixIcon,
    this.onChanged,
    this.textInputAction,
    this.contentPadding,
    this.prefixText,
    this.maxLength,
    this.buildCounter,
    this.borderRadius = const BorderRadius.all(Radius.circular(Insets.l)),
    this.scrollPadding = const EdgeInsets.all(20),
    this.hintStyle,
    this.hintMaxLines,
    this.style,
    this.useShadow = true,
  });

  final EdgeInsetsGeometry? margin;
  final FormControl<String> formControl;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final bool? hasError;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(FormControl<String> control)? onTap;
  final int? minLines;
  final int? maxLines;
  final Widget? prefixIcon;
  final void Function(String? value)? onChanged;
  final TextInputAction? textInputAction;
  final bool? showErrors;
  final bool? isDense;
  final Color? fillColor;
  final bool? autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final String? prefixText;
  final int? maxLength;
  final void Function(String? value)? onSubmitted;
  final InputCounterWidgetBuilder? buildCounter;
  final BorderRadius borderRadius;
  final EdgeInsets scrollPadding;
  final TextStyle? hintStyle;
  final int? hintMaxLines;
  final TextStyle? style;
  final bool useShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: Insets.l),
      child: ReactiveValueListenableBuilder<String>(
        formControl: formControl,
        builder: (
          BuildContext context,
          AbstractControl<String> control,
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
              if (useShadow)
                UIShadow.textField(child: _buildTextField(context))
              else
                _buildTextField(context),
            ],
          );
        },
      ),
    );
  }

  ReactiveTextField<String> _buildTextField(BuildContext context) {
    return ReactiveTextField<String>(
      scrollPadding: scrollPadding,
      autofocus: autofocus ?? false,
      textCapitalization: textCapitalization,
      minLines: minLines,
      maxLines: maxLines,
      textInputAction: textInputAction,
      onTap: onTap,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      buildCounter: buildCounter,
      onSubmitted: (FormControl<String> control) {
        onSubmitted?.call(formControl.value);
      },
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      formControl: formControl,
      showErrors: showErrors ?? true
          ? null
          : (AbstractControl<dynamic>? control) => false,
      readOnly: readOnly ?? false,

      // validationMessages: ReactiveErrors.validationMessages,
      decoration: InputDecoration(
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(48.0),
        //   borderSide: BorderSide(color: Colors.red),
        // ),
        contentPadding: contentPadding,
        isDense: isDense,
        prefixIcon: prefixIcon,
        hintText: hintText, // hasError ? labelText : hintText,
        hintStyle: hintStyle,
        hintMaxLines: hintMaxLines,
      ),
      style: style ?? Theme.of(context).textTheme.titleSmall,
    );
  }
}
