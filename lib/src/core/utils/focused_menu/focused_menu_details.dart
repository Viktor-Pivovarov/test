import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jojo/src/core/utils/_utils.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class FocusedMenuDetails extends StatelessWidget {
  const FocusedMenuDetails({
    required this.menuItems,
    required this.child,
    required this.childOffset,
    required this.childSize,
    required this.menuBoxDecoration,
    required this.itemExtent,
    required this.animateMenu,
    required this.blurSize,
    required this.blurBackgroundColor,
    required this.menuWidth,
    super.key,
    this.bottomOffsetHeight,
    this.menuOffset,
  });
  final List<FocusedMenuItem> menuItems;
  final BoxDecoration? menuBoxDecoration;
  final Offset childOffset;
  final double? itemExtent;
  final Size? childSize;
  final Widget child;
  final bool animateMenu;
  final double? blurSize;
  final double? menuWidth;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final maxMenuHeight = size.height * 0.45;
    final listHeight = menuItems.length * (itemExtent ?? 50.0);

    final maxMenuWidth = menuWidth ?? (size.width * 0.70);
    final menuHeight = listHeight < maxMenuHeight ? listHeight : maxMenuHeight;
    final leftOffset = (childOffset.dx + maxMenuWidth) < size.width
        ? childOffset.dx
        : (childOffset.dx - maxMenuWidth + childSize!.width);
    final topOffset = (childOffset.dy + menuHeight + childSize!.height) <
            size.height - bottomOffsetHeight!
        ? childOffset.dy + childSize!.height + menuOffset!
        : childOffset.dy - menuHeight - menuOffset!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurSize ?? 4,
                  sigmaY: blurSize ?? 4,
                ),
                child: Container(
                  color: (blurBackgroundColor ?? Colors.black).withOpacity(0.7),
                ),
              ),
            ),
            Positioned(
              top: topOffset,
              right: leftOffset,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 200),
                builder: (BuildContext context, double value, Widget? child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                tween: Tween(begin: 0, end: 1),
                child: Container(
                  width: maxMenuWidth,
                  height: menuHeight,
                  decoration: menuBoxDecoration ??
                      BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(Insets.l)),
                      ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final FocusedMenuItem item = menuItems[index];
                        final Widget listItem = GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            item.onPressed();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(bottom: 1),
                            decoration: BoxDecoration(
                              color: item.backgroundColor ?? Colors.white,
                              borderRadius: BorderRadius.circular(Insets.l),
                            ),
                            height: itemExtent ?? 50.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: Insets.l,
                                horizontal: Insets.l,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  item.title,
                                  if (item.trailingIcon != null) ...[
                                    item.trailingIcon!,
                                  ],
                                ],
                              ),
                            ),
                          ),
                        );
                        if (animateMenu) {
                          return TweenAnimationBuilder(
                            builder: (context, int value, child) {
                              return Transform(
                                transform: Matrix4.rotationX(1.5708 * value),
                                alignment: Alignment.bottomCenter,
                                child: child,
                              );
                            },
                            tween: Tween(begin: 1, end: 0),
                            duration: Duration(milliseconds: index * 200),
                            child: listItem,
                          );
                        } else {
                          return listItem;
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: childOffset.dy,
              left: childOffset.dx,
              child: AbsorbPointer(
                child: SizedBox(
                  width: childSize!.width,
                  height: childSize!.height,
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
