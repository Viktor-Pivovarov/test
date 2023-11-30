import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_supporting/jojo_supporting.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const emailSupportingFormKey = 'email';
const descriptionSupportingFormKey = 'description';

class SupportingForm extends StatelessWidget {
  const SupportingForm({
    required this.formGroup,
    this.onSubmit,
    super.key,
  });

  final FormGroup formGroup;

  final void Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    final ThemeColors color = Theme.of(context).extension<ThemeColors>()!;
    final TextExtension textExtension =
        Theme.of(context).extension<TextExtension>()!;
    return ReactiveForm(
      formGroup: formGroup,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: UiAppBar(
          useColor: true,
          useShadow: true,
          title:
              Text(SupportingI18n.title, style: context.text.mainTitleMedium),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Insets.l,
                  vertical: Insets.xs,
                ),
                child: Text(
                  SupportingI18n.yourEmail,
                  style:
                      textExtension.cap.copyWith(color: color.smallTextColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Insets.l,
                  vertical: Insets.s,
                ),
                child: UiTextField<String>(
                  autofocus: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(
                      RegExp(r'\s'),
                    ),
                  ],
                  formControl: formGroup.controls[emailSupportingFormKey]!
                      as FormControl<String>,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Insets.s,
                ),
                child: UiTextAreaField(
                  hintText: SupportingI18n.describeIssueHint,
                  hintMaxLines: 10,
                  style: context.text.mainText
                      .copyWith(color: context.color.textColor),
                  maxLength: 500,
                  hintStyle: textExtension.mainTitle
                      .copyWith(color: color.smallTextColor),
                  minLines: 10,
                  maxLines: null,
                  formControl: formGroup.controls[descriptionSupportingFormKey]!
                      as FormControl<String>,
                ),
              ),
              const SizedBox(
                height: 108,
              ),
            ],
          ),
        ),
        bottomSheet: UiBottomSheet(
          child: ReactiveFormConsumer(
            builder: (context, formGroup, child) => UiButton(
              text: SupportingI18n.sendMessage,
              disabled: !formGroup.valid,
              suffixIcon: UiIcon(const AppIcons().iNavigation),
              onPressed: () {
                FocusScope.of(context).unfocus();
                onSubmit?.call();
              },
            ),
          ),
        ),
      ),
    );
  }
}
