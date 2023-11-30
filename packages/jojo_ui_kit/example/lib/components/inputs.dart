import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Buttons',
  type: Container,
  path: '[buttons]/buttons',
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

Widget inputsUseCase(BuildContext context) {
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
                      const Text('UiInputField'),
                      UiInputField(
                          hintText: 'Текст',
                          formControl: form.controls['inputField1']
                              as FormControl<String>),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      UiInputField(
                          hintText: 'Текст',
                          suffixIconPath: AssetsNew.icons.dsSearch.path,
                          formControl: form.controls['inputField1']
                              as FormControl<String>),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      UiInputField(
                          hintText: 'Текст',
                          disabled: true,
                          readOnly: true,
                          suffixIconPath: AssetsNew.icons.dsSearch.path,
                          formControl: form.controls['inputField1']
                              as FormControl<String>),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      const Text('UiInputTitledField'),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      UiInputTitledField(
                          hintText: 'Текст',
                          title: 'Заголовок',
                          suffixIconPath: AssetsNew.icons.dsSearch.path,
                          formControl: form.controls['inputField1']
                              as FormControl<String>),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      UiInputTitledField(
                          hintText: 'Текст',
                          title: 'Заголовок',
                          minLines: 5,
                          maxLines: null,
                          suffixIconPath: AssetsNew.icons.dsSearch.path,
                          formControl: form.controls['inputField2']
                              as FormControl<String>),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      UiInputTitledField(
                          hintText: 'Текст',
                          title: 'Заголовок',
                          minLines: 5,
                          maxLines: null,
                          disabled: true,
                          readOnly: true,
                          formControl: form.controls['inputField2']
                              as FormControl<String>),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      const Text('UiChatInputField'),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      UiChatInputField(
                          hintText: 'Ваше сообщение',
                          minLines: 1,
                          formControl: form.controls['inputField3']
                              as FormControl<String>,
                          onPressedSend: () {
                            print('UiChatInputField onPressedSend');
                          },
                          onSubmitted: (value) {
                            print('UiChatInputField onSubmitted $value');
                          },
                          onPressedPhoto: () {
                            print('UiChatInputField onPressedPhoto');
                          }),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      const Text('UiChatBlock'),
                      const SizedBox(
                        height: Insets.l,
                      ),
                      UiChatBlock(
                          title: 'У тебя закончились свидания',
                          description: 'Для начала общения пополни баланс',
                          onButtonPressed: () {
                            print('UiChatBlock onButtonPressed');
                          }),
                      ElevatedButton(
                          onPressed: () {
                            form.markAllAsTouched();
                          },
                          child: const Text('Validate'))
                    ],
                  ),
                ),
              )))));
}
