import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Buttons',
  type: Container,
  path: '[buttons]/buttons',
)
Widget buttonsUseCase(BuildContext context) {
  return SafeArea(
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
                      'Buttons main',
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: Insets.l,
            ),
            const SizedBox(
              height: Insets.l,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UiMainButton (Default)'),
                UiMainButton(
                  text: 'Понятно',
                  type: UiMainButtonType.defaultType,
                  onPressed: () {},
                ),
                const Text('UiMainButton (Default, disabled)'),
                UiMainButton(
                  text: 'Понятно',
                  type: UiMainButtonType.defaultType,
                  disabled: true,
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(
              height: Insets.xl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UiMainButton (Inverse)'),
                UiMainButton(
                  text: 'Понятно',
                  type: UiMainButtonType.inverse,
                  onPressed: () {},
                ),
                const Text('UiMainButton (Inverse, disabled)'),
                UiMainButton(
                  text: 'Понятно',
                  type: UiMainButtonType.inverse,
                  disabled: true,
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(
              height: Insets.xl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UiMainButton (Transparent)'),
                UiMainButton(
                  text: 'Понятно',
                  type: UiMainButtonType.transparent,
                  onPressed: () {},
                ),
                const Text('UiMainButton (Transparent, disable)'),
                UiMainButton(
                  text: 'Понятно',
                  type: UiMainButtonType.transparent,
                  disabled: true,
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(
              height: Insets.xl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UiMainButton (Outline)'),
                UiMainButton(
                  text: 'Понятно',
                  type: UiMainButtonType.outline,
                  onPressed: () {},
                ),
                const Text('UiMainButton (Outline, disabled)'),
                UiMainButton(
                  text: 'Понятно',
                  type: UiMainButtonType.outline,
                  disabled: true,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: Insets.xl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UiMainButton (Brand Gradient)'),
                UiMainButton(
                  text: 'Понятно',
                  type: UiMainButtonType.brandGradient,
                  onPressed: () {},
                ),
                const Text('UiMainButton (Brand Gradient, disabled)'),
                UiMainButton(
                  text: 'Понятно',
                  type: UiMainButtonType.brandGradient,
                  disabled: true,
                  onPressed: () {},
                )
              ],
            ),
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buttons iconed',
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: Insets.xxl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UiIconedButton (Base)'),
                UiIconedButton(
                  text: 'Текст',
                  icon: UiIcon(AssetsNew.icons.dsChat.path),
                  type: UiIconedButtonType.base,
                  onPressed: () {},
                ),
                const Text('UiIconedButton (Base, disabled)'),
                UiIconedButton(
                  text: 'Текст',
                  icon: UiIcon(AssetsNew.icons.dsChat.path),
                  type: UiIconedButtonType.base,
                  onPressed: () {},
                  disabled: true,
                ),
              ],
            ),
            const SizedBox(
              height: Insets.xxl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UiIconedButton (Brand Gradient)'),
                UiIconedButton(
                  text: 'Текст',
                  icon: UiIcon(AssetsNew.icons.dsChat.path),
                  type: UiIconedButtonType.brandGradient,
                  onPressed: () {},
                ),
                const Text('UiIconedButton (Brand Gradient, disabled)'),
                UiIconedButton(
                  text: 'Текст',
                  icon: UiIcon(AssetsNew.icons.dsChat.path),
                  type: UiIconedButtonType.brandGradient,
                  onPressed: () {},
                  disabled: true,
                ),
              ],
            ),
            const SizedBox(
              height: Insets.xxl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UiIconedButton (Green)'),
                UiIconedButton(
                  text: 'Текст',
                  icon: UiIcon(AssetsNew.icons.dsChat.path),
                  type: UiIconedButtonType.green,
                  onPressed: () {},
                ),
                const Text('UiIconedButton (Green, disabled)'),
                UiIconedButton(
                  text: 'Текст',
                  icon: UiIcon(AssetsNew.icons.dsChat.path),
                  type: UiIconedButtonType.green,
                  onPressed: () {},
                  disabled: true,
                ),
              ],
            ),
            const SizedBox(
              height: Insets.xxl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UiIconedButton (Outline)'),
                UiIconedButton(
                  text: 'Текст',
                  icon: UiIcon(AssetsNew.icons.dsChat.path),
                  type: UiIconedButtonType.outline,
                  onPressed: () {},
                ),
                const Text('UiIconedButton (Outline, disabled)'),
                UiIconedButton(
                  text: 'Текст',
                  icon: UiIcon(AssetsNew.icons.dsChat.path),
                  type: UiIconedButtonType.outline,
                  onPressed: () {},
                  disabled: true,
                ),
              ],
            ),
            const SizedBox(
              height: Insets.xxl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UiIconedButton (Blue)'),
                UiIconedButton(
                  text: 'Текст',
                  icon: UiIcon(AssetsNew.icons.dsChat.path),
                  type: UiIconedButtonType.blue,
                  onPressed: () {},
                ),
                const Text('UiIconedButton (Blue, disabled)'),
                UiIconedButton(
                  text: 'Текст',
                  icon: UiIcon(AssetsNew.icons.dsChat.path),
                  type: UiIconedButtonType.blue,
                  onPressed: () {},
                  disabled: true,
                ),
              ],
            ),
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buttons special',
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: Insets.xxl,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Insets.s)),
              padding: const EdgeInsets.all(Insets.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'UiAppleButton',
                    style: TextStyle(color: context.colors.text.main),
                  ),
                  UiAppleButton(
                    text: 'Продолжить с Apple',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  UiAppleButton(
                    text: 'Продолжить с Apple',
                    disabled: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Insets.xxl,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Insets.s)),
              padding: const EdgeInsets.all(Insets.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'UiTelegramButton',
                    style: TextStyle(color: context.colors.text.main),
                  ),
                  UiTelegramButton(
                    text: 'Продолжить с Telegram',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  UiTelegramButton(
                    text: 'Продолжить с Telegram',
                    disabled: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Insets.xxl,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Insets.s)),
              padding: const EdgeInsets.all(Insets.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('UiGoogleButton',
                      style: TextStyle(color: context.colors.text.main)),
                  UiGoogleButton(
                    text: 'Продолжить с Google',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  UiGoogleButton(
                    text: 'Продолжить с Google',
                    disabled: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Insets.xxl,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: context.colors.bg.primary,
                  borderRadius: BorderRadius.circular(Insets.s)),
              padding: const EdgeInsets.all(Insets.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('UiRoundButton (Green)',
                      style: TextStyle(color: context.colors.text.main)),
                  UiRoundButton(
                    type: UiRoundButtonType.green,
                    icon: UiIcon(AssetsNew.icons.dsAddAPhoto.path),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Text('UiRoundButton (Red)',
                      style: TextStyle(color: context.colors.text.main)),
                  UiRoundButton(
                    type: UiRoundButtonType.red,
                    icon: UiIcon(AssetsNew.icons.dsAddAPhoto.path),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Text('UiRoundButton (Disabled)',
                      style: TextStyle(color: context.colors.text.main)),
                  UiRoundButton(
                    type: UiRoundButtonType.red,
                    disabled: true,
                    icon: UiIcon(AssetsNew.icons.dsAddAPhoto.path),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Text('UiAddRoundButton',
                      style: TextStyle(color: context.colors.text.main)),
                  UiAddRoundButton(
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Text('UiMessageSendButton',
                      style: TextStyle(color: context.colors.text.main)),
                  UiMessageSendButton(
                    onPressed: () {},
                  ),
                  Text('UiDeleteRoundButton',
                      style: TextStyle(color: context.colors.text.main)),
                  UiDeleteRoundButton(
                    onPressed: () {},
                  ),
                  Text('UiContextButton',
                      style: TextStyle(color: context.colors.text.main)),
                  UiContextButton(
                    icon: UiIcon(AssetsNew.icons.dsTrash.path),
                    label: 'Удалить у всех',
                    onPressed: () {
                      print('UiContextButton pressed');
                    },
                  ),
                  Text('UiMiniButton (Default)',
                      style: TextStyle(color: context.colors.text.main)),
                  UiMiniButton(
                    text: 'Текст',
                    onPressed: () {
                      print('UiMiniButton pressed');
                    },
                  ),
                  Text('UiMiniButton (Default, disabled)',
                      style: TextStyle(color: context.colors.text.main)),
                  UiMiniButton(
                    text: 'Текст',
                    disabled: true,
                    onPressed: () {
                      print('UiMiniButton pressed');
                    },
                  ),
                  Text('UiMiniButton (Inverse)',
                      style: TextStyle(color: context.colors.text.main)),
                  UiMiniButton(
                    text: 'Текст',
                    type: UiMiniButtonType.inverse,
                    onPressed: () {
                      print('UiMiniButton pressed');
                    },
                  ),
                  Text('UiMiniButton (Inverse, disabled)',
                      style: TextStyle(color: context.colors.text.main)),
                  UiMiniButton(
                    text: 'Текст',
                    type: UiMiniButtonType.inverse,
                    disabled: true,
                    onPressed: () {
                      print('UiMiniButton pressed');
                    },
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Text('UiSegmentedButton (default, left)',
                      style: TextStyle(color: context.colors.text.main)),
                  UiSegmentedButton<String>(
                    items: const ['Текст 1', 'Текст 2'],
                    selected: 'Текст 1',
                    itemBuilder: (item) => item,
                    onPressed: (index, item) {
                      print('UiSegmentedButton pressed $index , $item');
                    },
                  ),
                  Text('UiSegmentedButton (default, right)',
                      style: TextStyle(color: context.colors.text.main)),
                  UiSegmentedButton<String>(
                    items: const ['Текст 1', 'Текст 2'],
                    selected: 'Текст 2',
                    itemBuilder: (item) => item,
                    onPressed: (index, item) {
                      print('UiSegmentedButton pressed $index , $item');
                    },
                  ),
                  Text('UiSegmentedButton (default, right, disabled)',
                      style: TextStyle(color: context.colors.text.main)),
                  UiSegmentedButton<String>(
                    items: const ['Текст 1', 'Текст 2'],
                    selected: 'Текст 2',
                    disabled: true,
                    itemBuilder: (item) => item,
                    onPressed: (index, item) {
                      print('UiSegmentedButton pressed $index , $item');
                    },
                  ),
                  Text('UiSegmentedButton (outline )',
                      style: TextStyle(color: context.colors.text.main)),
                  UiSegmentedButton<String>(
                    items: const ['Текст 1', 'Текст 2'],
                    type: UiSegmentedButtonType.outline,
                    itemBuilder: (item) => item,
                    onPressed: (index, item) {
                      print('UiSegmentedButton pressed $index , $item');
                    },
                  ),
                  Text('UiSegmentedButton (outline, left )',
                      style: TextStyle(color: context.colors.text.main)),
                  UiSegmentedButton<String>(
                    items: const ['Текст 1', 'Текст 2'],
                    selected: 'Текст 1',
                    type: UiSegmentedButtonType.outline,
                    itemBuilder: (item) => item,
                    onPressed: (index, item) {
                      print('UiSegmentedButton pressed $index , $item');
                    },
                  ),
                  Text('UiSegmentedButton (outline, right )',
                      style: TextStyle(color: context.colors.text.main)),
                  UiSegmentedButton<String>(
                    items: const ['Текст 1', 'Текст 2'],
                    selected: 'Текст 2',
                    type: UiSegmentedButtonType.outline,
                    itemBuilder: (item) => item,
                    onPressed: (index, item) {
                      print('UiSegmentedButton pressed $index , $item');
                    },
                  ),
                  Text('UiSegmentedButton (outline, disabled )',
                      style: TextStyle(color: context.colors.text.main)),
                  UiSegmentedButton<String>(
                    items: const ['Текст 1', 'Текст 2'],
                    disabled: true,
                    type: UiSegmentedButtonType.outline,
                    itemBuilder: (item) => item,
                    onPressed: (index, item) {
                      print('UiSegmentedButton pressed $index , $item');
                    },
                  ),
                ],
              ),
            )
          ],
        ))),
  );
}
