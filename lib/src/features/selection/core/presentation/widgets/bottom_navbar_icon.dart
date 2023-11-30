import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class SelectionBottomNavbarIcon extends StatelessWidget {
  const SelectionBottomNavbarIcon({
    required this.onPressed,
    required this.isActive,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionCubit, SelectionState>(
      bloc: SelectionInjection.sl(),
      builder: (context, state) {
        return BottomNavbarIcon(
          icon: Assets.icons.iSelection,
          onPressed: onPressed,
          isActive: isActive,
        );
      },
    );
  }
}
