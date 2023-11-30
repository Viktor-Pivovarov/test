import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class LikedLoadingScreen extends StatelessWidget {
  const LikedLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: Insets.l),
          child: Row(
            children: [
              Expanded(child: Text(LikedI18n.title)),
              const SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  width: 70,
                  height: 24,
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: Insets.xl,
              left: Insets.l,
              right: Insets.l,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: Insets.s),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                      width:
                          (MediaQuery.of(context).size.width - 2 * Insets.l) /
                              1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Insets.s),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                      width:
                          (MediaQuery.of(context).size.width - 2 * Insets.l) /
                              1.1,
                    ),
                  ),
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    width:
                        (MediaQuery.of(context).size.width - 2 * Insets.l) / 2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.xl, left: Insets.l),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: Sort.values.map((e) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: 148,
                        height: 24,
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const LikedLoadingPhotoScreen(),
          const SizedBox(
            height: Insets.bottomNavBar,
          ),
        ],
      ),
    );
  }
}

class LikedLoadingPhotoScreen extends StatelessWidget {
  const LikedLoadingPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.l),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: Insets.s,
            crossAxisSpacing: Insets.s,
            crossAxisCount: 2,
            childAspectRatio:
                ((MediaQuery.of(context).size.width - 2 * Insets.l - Insets.s) /
                        2) /
                    254,
          ),
          itemBuilder: (context, index) {
            return const Stack(
              children: <Widget>[
                SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: double.infinity,
                    height: 264,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
