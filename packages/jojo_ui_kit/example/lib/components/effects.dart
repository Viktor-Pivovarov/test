import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Effects',
  type: Container,
  path: '[colors]/effects',
)
Widget effectsUseCase(BuildContext context) {
  return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Insets.l),
                        margin: const EdgeInsets.all(Insets.s),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Insets.s)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [context.effects.redGlow],
                              borderRadius: BorderRadius.circular(Insets.s)),
                          margin: const EdgeInsets.all(Insets.s),
                          width: Insets.xxxl,
                          height: Insets.xxxl,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText('Red Glow'),
                          SelectableText('context.effects.redGlow')
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Insets.l),
                        margin: const EdgeInsets.all(Insets.s),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Insets.s)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [context.effects.blueGlow],
                              borderRadius: BorderRadius.circular(Insets.s)),
                          margin: const EdgeInsets.all(Insets.s),
                          width: Insets.xxxl,
                          height: Insets.xxxl,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText('Blue Glow'),
                          SelectableText('context.effects.blueGlow')
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Insets.l),
                        margin: const EdgeInsets.all(Insets.s),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Insets.s)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [context.effects.goldenGlow],
                              borderRadius: BorderRadius.circular(Insets.s)),
                          margin: const EdgeInsets.all(Insets.s),
                          width: Insets.xxxl,
                          height: Insets.xxxl,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText('Glod Glow'),
                          SelectableText('context.effects.glodGlow')
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Insets.l),
                        margin: const EdgeInsets.all(Insets.s),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Insets.s)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [context.effects.greenGlow],
                              borderRadius: BorderRadius.circular(Insets.s)),
                          margin: const EdgeInsets.all(Insets.s),
                          width: Insets.xxxl,
                          height: Insets.xxxl,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText('Green Glow'),
                          SelectableText('context.effects.greenGlow')
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Insets.l),
                        margin: const EdgeInsets.all(Insets.s),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Insets.s)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [context.effects.tabBarShadow],
                              borderRadius: BorderRadius.circular(Insets.s)),
                          margin: const EdgeInsets.all(Insets.s),
                          width: Insets.xxxl,
                          height: Insets.xxxl,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText('Tab bar shadow'),
                          SelectableText('context.effects.tabBarShadow')
                        ],
                      )
                    ],
                  ),
                ],
              )))));
}
