import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiSendField extends StatelessWidget {
  const UiSendField({
    required this.formControl,
    required this.onSubmit,
    this.focusNode,
    super.key,
  });

  final FocusNode? focusNode;

  final FormControl<String> formControl;

  final void Function(String value) onSubmit;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: FormGroup({'input': formControl}),
      child: UiBottomSheet(
        padding:
            const EdgeInsets.fromLTRB(Insets.l, Insets.l, Insets.l, Insets.xl),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // UiIcon.button(
            //   AssetsNew.icons.dsCamera.path,
            //   onPressed: () {},
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: Insets.xs),
                child: ReactiveTextField<String>(
                  formControl: formControl,
                  maxLines: 15,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  focusNode: focusNode,
                  scrollPadding: EdgeInsets.zero,
                  showErrors: (control) => false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(Insets.l),
                    ),
                    fillColor: context.colors.bg.primary,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: Insets.s,
                      horizontal: Insets.l,
                    ),
                    labelStyle: context.texts.body.base.copyWith(
                      color: context.colors.text.main,
                    ),
                  ),
                ),
              ),
            ),
            ReactiveFormConsumer(
              builder: (context, form, child) {
                Color _buttonColor = context.colors.button.disabled;

                if (form.valid) {
                  _buttonColor = context.colors.content.success;
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: Insets.xs),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: _buttonColor,
                      child: InkWell(
                        splashColor: _buttonColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(100),
                        onTap: !form.valid
                            ? null
                            : () {
                                focusNode?.unfocus();
                                onSubmit(formControl.value ?? '');
                              },
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: UiIcon(
                            AssetsNew.icons.dsArrowUp.path,
                            color: context.colors.content.inverse,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
