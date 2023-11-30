import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UiPhoneField extends StatefulWidget {
  const UiPhoneField({
    required this.formControl,
    super.key,
    this.margin,
    this.labelText,
    this.hintText,
    this.focusNode,
    this.onSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.useMask,
    this.onTap,
    this.readOnly = false,
  });

  final EdgeInsetsGeometry? margin;
  final FormControl<String> formControl;
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;
  final void Function(String? value)? onSubmitted;
  final TextCapitalization textCapitalization;
  final bool? useMask;
  final bool? readOnly;

  final void Function(FormControl<String> control)? onTap;

  @override
  State<UiPhoneField> createState() => _UiPhoneFieldState();
}

class _UiPhoneFieldState extends State<UiPhoneField> {
  EdgeInsetsGeometry? get margin => widget.margin;
  FormControl<String> get formControl => widget.formControl;
  String? get labelText => widget.labelText;
  String? get hintText => widget.hintText ?? '(123) 456-78-90';
  FocusNode? get focusNode => widget.focusNode;
  void Function(String? value)? get onSubmitted => widget.onSubmitted;
  TextCapitalization get textCapitalization => widget.textCapitalization;
  bool get useMask => widget.useMask ?? true;
  bool get readOnly => widget.readOnly ?? false;

  final TextEditingController _controller = TextEditingController();

  final MaskTextInputFormatter _formatter = _RussiaMaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: <String, RegExp>{'#': RegExp('[0-9]')},
  );

  @override
  void initState() {
    if (formControl.value != null && formControl.value.toString().isNotEmpty) {
      _initTextController();
    }

    super.initState();
  }

  void _initTextController() {
    final String value =
        formControl.value.toString().replaceAll(RegExp(r'((\+7)|[() -])'), '');

    _formatter.formatEditUpdate(
      const TextEditingValue(),
      TextEditingValue(text: value),
    );

    _controller.text = _formatter.getMaskedText();

    formControl.value = _formatter.getMaskedText();
  }

  @override
  void didUpdateWidget(UiPhoneField oldWidget) {
    if (oldWidget.formControl.value != widget.formControl.value) {
      // _initTextController();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<String>(
      formControl: formControl,
      builder: (
        BuildContext context,
        AbstractControl<String> control,
        Widget? child,
      ) {
        final bool hasError = control.invalid && control.touched;

        return UiTextField<String>(
          readOnly: readOnly,
          inputFormatters: useMask
              ? <MaskTextInputFormatter>[_formatter]
              : <MaskTextInputFormatter>[],
          formControl: formControl,
          margin: margin,
          labelText: labelText,
          prefixText: useMask ? '+7 ' : '+',
          hintText: hintText,
          keyboardType: TextInputType.phone,
          focusNode: focusNode,
          onSubmitted: (String? value) => onSubmitted?.call(value),
          textCapitalization: textCapitalization,
          hasError: hasError,
          onTap: widget.onTap,
        );
      },
    );
  }
}

class _RussiaMaskTextInputFormatter extends MaskTextInputFormatter {
  _RussiaMaskTextInputFormatter({
    required String super.mask,
    super.filter,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '8' || newValue.text.startsWith('+7 (8')) {
      const String prefix = '+7 (';
      return TextEditingValue(
        text: prefix,
        selection: TextSelection.fromPosition(
          const TextPosition(offset: prefix.length),
        ),
      );
    }
    return super.formatEditUpdate(oldValue, newValue);
  }
}
