import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Colors',
  type: Container,
  path: '[colors]/colors',
)
Widget colorsUseCase(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Фон',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text('Фоновые элементы - заливки экранов, карточки')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.bg.primary,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Primary'),
                      SelectableText('context.colors.bg.primary')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.bg.secondary,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Secondary'),
                      SelectableText('context.colors.bg.secondary')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.bg.tertiary,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Tertiary'),
                      SelectableText('context.colors.bg.tertiary')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.bg.brand,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Brand'),
                      SelectableText('context.colors.bg.brand')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.bg.darker,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Darker'),
                      SelectableText('context.colors.bg.darker')
                    ],
                  )
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Типографика',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                            'Текстовые элементы - заголовки, описания, интерактивные элементы, ссылки')
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.text.constantWhite,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Constant white'),
                      SelectableText('context.colors.text.constantWhite')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.text.main,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Main'),
                      SelectableText('context.colors.text.main')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.text.secondary,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Secondary'),
                      SelectableText('context.colors.text.secondary')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.text.link,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Link'),
                      SelectableText('context.colors.text.link')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.text.green,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Green'),
                      SelectableText('context.colors.text.green')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.text.error,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Error'),
                      SelectableText('context.colors.text.error')
                    ],
                  )
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          'Кнопки',
                          style: TextStyle(fontSize: 40),
                        ),
                        SelectableText('Активные кнопочные элементы')
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.button.brand,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Brand'),
                      SelectableText('context.colors.button.brand')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.button.positive,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Green'),
                      SelectableText('context.colors.button.positive')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.button.disabled,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Disabled'),
                      SelectableText('context.colors.button.disabled')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.button.telegram,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Telegram'),
                      SelectableText('context.colors.button.telegram')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.button.inverse,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Inverse'),
                      SelectableText('context.colors.button.inverse')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Контент',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text('Икноки, графические элементы и прочее')
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.content.brand,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Brand'),
                      SelectableText('context.colors.content.brand')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.content.positive,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Green'),
                      SelectableText('context.colors.content.positive')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.content.secondary,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Secondary'),
                      SelectableText('context.colors.content.secondary')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.content.tertiary,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Tertiary'),
                      SelectableText('context.colors.content.tertiary')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.content.telegram,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Telegram'),
                      SelectableText('context.colors.content.telegram')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.content.inverse,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Inverse'),
                      SelectableText('context.colors.content.inverse')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.content.base,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Base'),
                      SelectableText('context.colors.content.base')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.content.gold,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Gold'),
                      SelectableText('context.colors.content.gold')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: context.colors.content.brandGradient,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Brand gradient'),
                      SelectableText('context.colors.content.brandGradient')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cистемные цвета',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text('Только для отображения системных элементов')
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.system.base,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Black'),
                      SelectableText('context.colors.system.base')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: Insets.l,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.text.constantWhite,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    margin: const EdgeInsets.all(Insets.s),
                    width: Insets.xxxl,
                    height: Insets.xxxl,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('White'),
                      SelectableText('context.colors.text.constantWhite')
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
