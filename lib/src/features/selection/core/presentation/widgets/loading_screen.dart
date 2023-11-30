import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/core/_core.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class SelectionLoadingScreen extends StatelessWidget {
  const SelectionLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: Insets.s),
              child: Text(SelectionI18n.searching),
            ),
            const CupertinoActivityIndicator(radius: 6),
          ],
        ),
      ),
      body: Padding(
        padding: Insets.getDefaultPageInsetsWithBottomBar(context),
        child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            borderRadius: BorderRadius.circular(Insets.m),
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                (Insets.bottomNavBar * 2) -
                Insets.l,
          ),
        ),
      ),
    );
  }
}
