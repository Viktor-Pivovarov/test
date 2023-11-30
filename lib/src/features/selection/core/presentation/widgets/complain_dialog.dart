import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ComplainDialog extends StatefulWidget {
  const ComplainDialog({required this.complainReasons, super.key, this.name});

  final String? name;
  final List<DictModel> complainReasons;

  @override
  State<ComplainDialog> createState() => _ComplainDialogState();
}

class _ComplainDialogState extends State<ComplainDialog> {
  late FormGroup _form;
  late FormArray<bool> formControls;

  @override
  void initState() {
    super.initState();

    formControls = FormArray<bool>([]);

    for (final _ in widget.complainReasons) {
      formControls.add(FormControl());
    }

    _form = FormGroup({'reasons': formControls});
  }

  void _close([List<int>? result]) {
    DialogService.hide<List<int>?>(
      identifier: PositionedDialog.identifier(
        position: EasyDialogPosition.bottom,
      ),
      result: result,
    );
  }

  void _submit() {
    final array = _form.value['reasons']! as List<bool?>;

    final request = array
        .mapIndexed((i, e) {
          if (e ?? false) {
            return widget.complainReasons.elementAt(i).id;
          }

          return null;
        })
        .where((element) => element != null)
        .cast<int>()
        .toList();

    _close(request);
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _form,
      child: FractionallySizedBox(
        heightFactor: 0.7,
        child: UiCard.white(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(Insets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: Insets.l),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: _close,
                        child: UiIcon(Assets.icons.iCross),
                      ),
                    ),
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: Insets.s),
                            child: UiIcon(
                              Assets.icons.iconsFlag,
                              width: 20,
                              color: context.color.mainAccentColor,
                            ),
                          ),
                          Text(
                            CoreI18n.complain,
                            style: context.text.mainTitle.copyWith(
                              color: context.color.mainAccentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(CoreI18n.complainReasons, style: context.text.mainTitle),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: formControls.controls.mapIndexed((index, control) {
                    return UiCheckboxField(
                      formControl: control as FormControl<bool>,
                      label: widget.complainReasons.elementAt(index).name,
                      // description:
                      //     isSystemLanguage ? LanguagesI18n.systemLanguage : null,
                      // readOnly: isSystemLanguage,
                    );
                  }).toList(),
                ),
              ),
              if (widget.name != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: Insets.l),
                  child: Text(
                    CoreI18n.willNotKnow(widget.name ?? ''),
                    style: context.text.mainText.copyWith(
                      color: context.color.mainAccentColor,
                    ),
                  ),
                ),
              ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  final array =
                      formGroup.controls['reasons']! as FormArray<bool>;

                  return UiButton(
                    text: CoreI18n.block,
                    disabled: !array.controls.any(
                      (element) {
                        return element.value ?? false;
                      },
                    ),
                    onPressed: _submit,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
