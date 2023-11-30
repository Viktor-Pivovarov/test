import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChipField extends StatelessWidget {
  const UiChipField({super.key, this.formControl, this.title = '', this.onTap});

  final FormControl<bool>? formControl;

  final void Function()? onTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder(
      builder: (context, control, child) {
        final value = control.value ?? false;
        return GestureDetector(
          onTap: () {
            control.value = !value;
            onTap?.call();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Insets.xl),
              color: value
                  ? context.color.mainAccentColor
                  : context.color.cardBGColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(Insets.m),
              child: Text(
                title,
                style: context.text.mainTextMedium.copyWith(
                  color: value ? Colors.white : context.color.smallTextColor,
                ),
              ),
            ),
          ),
        );
      },
      formControl: formControl,
    );
  }
}
