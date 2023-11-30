import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:jojo_ui_kit/src/widgets/form_fields/form_errors.dart';

class UiChatInputField extends StatelessWidget {
  const UiChatInputField({
    required this.formControl,
    required this.onPressedSend,
    required this.onPressedPhoto,
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
    this.onChanged,
    this.textInputAction,
    this.contentPadding,
    this.maxLength,
    this.buildCounter,
    this.validationMessages,
  });

  final VoidCallback onPressedSend;
  final VoidCallback onPressedPhoto;
  final EdgeInsetsGeometry? padding;
  final FormControl<String> formControl;
  final String? hintText;

  final bool obscureText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final bool? hasError;
  final bool readOnly;
  final bool disabled;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(FormControl<String> control)? onTap;
  final int? minLines;
  final int? maxLines;
  final ReactiveFormFieldCallback<String>? onChanged;
  final TextInputAction? textInputAction;
  final bool? showErrors;
  final bool? isDense;
  final Color? fillColor;
  final bool? autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final void Function(String? value)? onSubmitted;
  final InputCounterWidgetBuilder? buildCounter;
  final Map<String, String Function(Object)>? validationMessages;

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<String>(
      formControl: formControl,
      builder: (
        BuildContext context,
        AbstractControl<String> control,
        Widget? child,
      ) {
        // final bool hasError = control.invalid && control.touched;

        final isEmpty = control.value?.isEmpty ?? true;
        return Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  InkWell(
                    onTap: onPressedPhoto,
                    child: UiIcon(AssetsNew.icons.dsCamera.path),
                  ),
                  const SizedBox(
                    width: Insets.m,
                  ),
                  Expanded(child: _buildTextField(context)),
                  const SizedBox(
                    width: Insets.xs,
                  ),
                  UiRoundButton(
                    type: UiRoundButtonType.green,
                    disabled: isEmpty,
                    onPressed: isEmpty ? null : onPressedSend,
                    padding: const EdgeInsets.all(6),
                    icon: UiIcon(AssetsNew.icons.dsArrowUp.path),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  ReactiveTextField<String> _buildTextField(BuildContext context) {
    return ReactiveTextField<String>(
      autofocus: autofocus ?? false,
      textCapitalization: textCapitalization,
      minLines: minLines,
      maxLines: maxLines,
      textInputAction: textInputAction,
      onTap: disabled ? null : onTap,
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
      showErrors: showErrors ?? false
          ? (AbstractControl<dynamic>? control) =>
              control?.errors.isNotEmpty ?? false
          : null,
      readOnly: readOnly,
      onChanged: onChanged,
      validationMessages: validationMessages ?? ReactiveErrors.errorMethods,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.texts.body.base
            .copyWith(color: context.colors.text.secondary),

        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: context.colors.bg.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Insets.l),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Insets.l),
          borderSide: BorderSide.none,
        ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(48.0),
        //   borderSide: BorderSide(color: Colors.red),
        // ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: Insets.m,
          horizontal: Insets.m,
        ),
        isDense: true,
      ),
      style: context.texts.body.base,
      /*   style: disabled
          ? context.text.smallTitle
              .copyWith(color: Theme.of(context).disabledColor)
          : context.text.smallTitle,*/
    );
  }
}
