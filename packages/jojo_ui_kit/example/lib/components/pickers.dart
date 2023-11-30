import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Pickers',
  type: Container,
  path: '[pickers]/pickers',
)
final form = FormGroup({
  'inputField1': FormControl<String>(validators: [Validators.required]),
  'inputField2': FormControl<String>(validators: [Validators.required]),
  'inputField3': FormControl<String>()
});
/*
  Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Insets.s)),
              padding: const EdgeInsets.all(Insets.s),
*/

Widget pickersUseCase(BuildContext context) {
  return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultTextStyle(
              style: const TextStyle(color: Colors.black),
              child: SingleChildScrollView(
                  child: ReactiveForm(
                formGroup: FormGroup({
                  'inputField1': FormControl<String>(),
                  'inputField2': FormControl<String>(value: 'Текст')
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: context.colors.bg.secondary,
                      borderRadius: BorderRadius.circular(Insets.s)),
                  padding: const EdgeInsets.all(Insets.s),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('UiDatePicker'),
                      UiDatePicker(
                          date: DateTime.now(),
                          onChanged: (value) {
                            print('UiDatePicker onChanged $value');
                          }),
                      const Text('UiDatePicker (disabled)'),
                      UiDatePicker(
                          date: DateTime.now(),
                          disabled: true,
                          onChanged: (value) {
                            print('UiDatePicker onChanged $value');
                          }),
                      const Text('UiTimePicker'),
                      UiTimePicker(
                        hours: 2,
                        minutes: 2,
                        onChange: (value) {
                          print('UiTimePicker onChanged $value');
                        },
                      ),
                      const Text('UiTimePicker (disabled)'),
                      UiTimePicker(
                        hours: 2,
                        minutes: 2,
                        disabled: true,
                        onChange: (value) {
                          print('UiTimePicker onChanged $value');
                        },
                      ),
                      const Text('UiAgePicker'),
                      UiAgePicker(
                        labelFrom: 'От:',
                        labelTo: 'До:',
                        onChange: (from, to) {
                          print('UiAgePicker onChanged $from $to');
                        },
                      ),
                      const Text('UiAgePicker (disabled)'),
                      UiAgePicker(
                        labelFrom: 'От:',
                        labelTo: 'До:',
                        disabled: true,
                        onChange: (from, to) {
                          print('UiAgePicker onChanged $from $to');
                        },
                      ),
                      const Text('UiRouletteControl'),
                      UiRouletteControl(
                        from: 50,
                        to: 250,
                        label: 'Сантиметров',
                        value: 176,
                        onSelectedItemChanged: (value) {
                          print('UiRoulleteControl onChanged $value');
                        },
                      ),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      const Text('UiRouletteControl (disabled)'),
                      UiRouletteControl(
                        from: 50,
                        to: 250,
                        label: 'Сантиметров',
                        value: 176,
                        disabled: true,
                        onSelectedItemChanged: (value) {
                          print('UiRoulleteControl onChanged $value');
                        },
                      ),
                    ],
                  ),
                ),
              )))));
}
