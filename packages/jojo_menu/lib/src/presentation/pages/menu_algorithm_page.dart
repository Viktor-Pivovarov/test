import 'package:flutter/material.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class MenuAlgorithmPage extends StatelessWidget {
  const MenuAlgorithmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        useColor: true,
        title: Text(
          MenuI18n.selectionAlgorithm,
          style: context.text.mainTitleMedium,
        ),
      ),
      body: BlocBuilder<MenuAlgorithmCubit, MenuAlgorithmState>(
        builder: (context, state) {
          return const AlgorithmWidget();
        },
      ),
    );
  }
}
