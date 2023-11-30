import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiSwitchField extends StatelessWidget {
  const UiSwitchField({super.key, this.formControl, this.onTap});

  final FormControl<bool>? formControl;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder(
      builder: (context, control, child) {
        final value = control.value ?? false;
        return GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 51,
            height: 31,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Insets.l),
              color: value
                  ? context.color.mainAccentColor
                  : context.color.disabledColor,
            ),
            child: AnimatedAlign(
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 100),
              child: Container(
                margin: const EdgeInsets.only(left: 3, right: 3),
                width: 27,
                height: 27,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
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
