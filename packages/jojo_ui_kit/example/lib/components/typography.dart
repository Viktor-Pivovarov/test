import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Typography',
  type: Container,
  path: '[typography]/typography',
)
Widget typographyUseCase(BuildContext context) {
  return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Декор 56 ', style: context.texts.decor.decorative),
                      const SelectableText('context.texts.decor.decorative')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Основной текст', style: context.texts.headline.big),
                      const SelectableText('context.texts.headline.big')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Заголовок второго уровня',
                          style: context.texts.headline.second),
                      const SelectableText('context.texts.headline.second')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Тайтл базовый', style: context.texts.title.base),
                      const SelectableText('context.texts.title.base')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Тайтл облегченный',
                          style: context.texts.title.light),
                      const SelectableText('context.texts.title.light')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Кнопка', style: context.texts.button.button),
                      const SelectableText('context.texts.button.button')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Тайтл облегченный',
                          style: context.texts.body.bigSemibold),
                      const SelectableText('context.texts.body.bigSemibold')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Тайтл облегченный',
                          style: context.texts.body.bodyLight),
                      const SelectableText('context.texts.body.bodyLight')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Тайтл облегченный',
                          style: context.texts.body.baseSemibold),
                      const SelectableText('context.texts.body.baseSemibold')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Тайтл облегченный', style: context.texts.body.base),
                      const SelectableText('context.texts.body.base')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Тайтл облегченный',
                          style: context.texts.footnote.baseSemibold),
                      const SelectableText(
                          'context.texts.footnote.baseSemibold')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Тайтл облегченный',
                          style: context.texts.footnote.base),
                      const SelectableText('context.texts.footnote.base')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Тайтл облегченный',
                          style: context.texts.caption.caption),
                      const SelectableText('context.texts.caption.caption')
                    ],
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Пометки', style: context.texts.caption.mark),
                      const SelectableText('context.texts.caption.mark')
                    ],
                  ),
                ],
              )))));
}
