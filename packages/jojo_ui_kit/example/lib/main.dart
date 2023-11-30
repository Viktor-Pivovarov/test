import 'package:example/components/assets.dart';
import 'package:example/components/buttons.dart';
import 'package:example/components/colors.dart';
import 'package:example/components/effects.dart';
import 'package:example/components/inputs.dart';
import 'package:example/components/pickers.dart';
import 'package:example/components/typography.dart';
import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(addons: [
      DeviceFrameAddon(devices: Devices.ios.all),
      InspectorAddon(),
      GridAddon(100),
      AlignmentAddon(),
      ZoomAddon(),
      ThemeAddon(
          themes: [
            WidgetbookTheme(name: 'light', data: createLightTheme()),
            WidgetbookTheme(name: 'dark', data: createDarkTheme())
          ],
          themeBuilder: (context, theme, child) {
            return Theme(
              data: theme,
              child: child,
            );
          })
    ], directories: [
      WidgetbookFolder(name: 'Core Tokens', children: [
        WidgetbookComponent(
          name: 'Colors',
          useCases: [
            WidgetbookUseCase(
              name: 'Colors',
              builder: (context) => colorsUseCase(context),
            ),
            WidgetbookUseCase(
              name: 'Effects',
              builder: (context) => effectsUseCase(context),
            ),
          ],
        ),
      ]),
      WidgetbookFolder(name: 'Typography', children: [
        WidgetbookComponent(
          name: 'Typography',
          useCases: [
            WidgetbookUseCase(
              name: 'Typography',
              builder: (context) => typographyUseCase(context),
            ),
          ],
        ),
      ]),
      WidgetbookFolder(name: 'Assets', children: [
        WidgetbookComponent(
          name: 'Assets',
          useCases: [
            WidgetbookUseCase(
              name: 'Assets',
              builder: (context) => assetsUseCase(context),
            ),
          ],
        ),
      ]),
      WidgetbookFolder(name: 'Buttons', children: [
        WidgetbookComponent(
          name: 'Buttons',
          useCases: [
            WidgetbookUseCase(
              name: 'Buttons',
              builder: (context) => buttonsUseCase(context),
            ),
          ],
        ),
      ]),
      WidgetbookFolder(name: 'Inputs', children: [
        WidgetbookComponent(
          name: 'Inputs',
          useCases: [
            WidgetbookUseCase(
              name: 'Inputs',
              builder: (context) => inputsUseCase(context),
            ),
          ],
        ),
      ]),
      WidgetbookFolder(name: 'Pickers', children: [
        WidgetbookComponent(
          name: 'Pickers',
          useCases: [
            WidgetbookUseCase(
              name: 'Pickers',
              builder: (context) => pickersUseCase(context),
            ),
          ],
        ),
      ])
    ]);
  }
}
