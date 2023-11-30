import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class AppBarCandidates extends StatelessWidget {
  const AppBarCandidates({required this.items, super.key});

  final List<CandidateListItemEntity> items;

  double get _itemSize => Insets.xl;

  /// 1 шарик - 0 половинки
  /// 2 шарик - 1 половинка
  /// 3 шарик - 2 половинки
  /// 4 шарик - 3 половинки
  (int, num) _sumCountAndWidth(double maxWidth) {
    num result = _itemSize;

    if (items.length == 1) {
      return (1, result);
    }

    for (var i = 1; i < items.length; i++) {
      if (result + (_itemSize / 2) >= maxWidth) {
        return (i, result);
      }

      result += _itemSize / 2;
    }

    return (items.length, result);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final (count, width) =
            _sumCountAndWidth(constraints.maxWidth - (_itemSize / 2));

        return Container(
          width: width + (_itemSize / 2),
          height: _itemSize * 1.5,
          padding: EdgeInsets.all(_itemSize / 4),
          decoration: BoxDecoration(
            color: context.color.fillBgColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Stack(
            children: items.take(count).mapIndexed((i, e) {
              return Positioned(
                right: i * (_itemSize / 2),
                child: CircleAvatar(
                  backgroundColor: context.color.fillBgColor,
                  radius: _itemSize / 2,
                  child: CircleAvatar(
                    radius: _itemSize / 2 - 1,
                    foregroundImage: CachedNetworkImageProvider(e.photos.first),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
