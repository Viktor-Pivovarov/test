import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';

import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class LikedBottomNavbarIcon extends StatelessWidget {
  const LikedBottomNavbarIcon({
    required this.onPressed,
    required this.isActive,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LikedInjection.sl<LikedCubit>()..getDatingInfo(),
      child: BlocBuilder<LikedCubit, LikedState>(
        builder: (context, state) {
          final int count = state.datingInfo.newLikesMe;

          return BottomNavbarIcon(
            icon: Assets.icons.iHeart,
            onPressed: onPressed,
            isActive: isActive,
            badge: count > 0 ? Text(count.clamp(0, 999).toString()) : null,
          );
        },
      ),
    );
  }
}
