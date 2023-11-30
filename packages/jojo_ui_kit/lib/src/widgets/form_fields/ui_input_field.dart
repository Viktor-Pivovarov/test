import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:jojo_ui_kit/src/widgets/form_fields/form_errors.dart';

class UiInputField<T> extends StatelessWidget {
  const UiInputField({
    required this.formControl,
    super.key,
    this.padding,
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
    this.suffixIconPath,
    this.onChanged,
    this.textInputAction,
    this.contentPadding,
    this.prefixText,
    this.maxLength,
    this.buildCounter,
    this.validationMessages,
  });

  final EdgeInsetsGeometry? padding;
  final FormControl<T> formControl;
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
  final String? suffixIconPath;
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
  final Map<String, String Function(Object)>? validationMessages;

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<T>(
      formControl: formControl,
      builder: (
        BuildContext context,
        AbstractControl<T> control,
        Widget? child,
      ) {
        // final bool hasError = control.invalid && control.touched;
        return Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTextField(context),
            ],
          ),
        );
      },
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
        hintText: hintText,
        hintStyle: context.texts.footnote.base
            .copyWith(color: context.colors.text.secondary),

        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: context.colors.bg.primary,
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
        suffixIcon: _getSuffixIconWidget(context),
      ),
      style: context.texts.body.baseSemibold,
      /*   style: disabled
          ? context.text.smallTitle
              .copyWith(color: Theme.of(context).disabledColor)
          : context.text.smallTitle,*/
    );
  }

  Widget? _getSuffixIconWidget(BuildContext context) => suffixIconPath != null
      ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UiIcon(
              suffixIconPath ?? '',
              width: Insets.l,
              height: Insets.l,
              color: context.colors.content.secondary,
            ),
          ],
        )
      : null;
}
