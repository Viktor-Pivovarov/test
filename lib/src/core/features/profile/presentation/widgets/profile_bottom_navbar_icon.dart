import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ProfileBottomNavbarIcon extends StatelessWidget {
  const ProfileBottomNavbarIcon({
    required this.onPressed,
    required this.isActive,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: ProfileInjection.sl(),
      builder: (context, state) {
        return BottomNavbarIcon(
          icon: Assets.icons.iUser,
          onPressed: onPressed,
          isActive: isActive,
          badge: state.hasError
              ? Text(
                  '!',
                  style: context.texts.caption.mark.copyWith(height: 1),
                )
              : null,
        );
      },
    );
  }
}
