// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class ModerationBlock extends StatelessWidget {
  const ModerationBlock({
    super.key,
    this.child,
    this.positiveModifiedAt,
    this.onPressedCard,
    this.onModerate = false,
    this.onReModerate = false,
    this.margin,
  });

  final VoidCallback? onPressedCard;
  final Widget? child;
  final bool? onModerate;
  final bool? onReModerate;
  final DateTime? positiveModifiedAt;
  final EdgeInsetsGeometry? margin;

  bool get _onModerate => onModerate ?? false;

  // bool get _onReModerate => onReModerate ?? false;

  String get title =>
      _onModerate ? 'Аккаунт на модерации' : 'Повторная модерация';

  String get text {
    if (seconds == 0) {
      return 'В данный момент у нас много регистраций и нам надо еще немного времени. Извиняемся за неудобство.';
    }

    return _onModerate
        ? 'В это время заполни свой профиль на 100%, это влияет на рейтинг анкеты и подбор кандидатов.'
        : 'Мы проверяем изменения в твоём аккаунте. Пока кандидаты видят твой предыдущий профиль.';
  }

  int get seconds {
    int _seconds = 0;

    if (positiveModifiedAt != null) {
      _seconds = positiveModifiedAt!.difference(DateTime.now()).inSeconds;
    }

    if (_seconds < 0) {
      return 0;
    }

    return _seconds;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.l),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.topRight,
                image: CrossAssetImage(Assets.images.bg),
              ),
            ),
            child: SafeArea(child: UiCircleTimer(seconds: seconds)),
          ),
          UiCard(
            onPressed: onPressedCard,
            margin: margin ?? const EdgeInsets.symmetric(horizontal: Insets.l),
            title: title,
            text: text,
            suffixIcon: CrossPlatformSvg.asset(
              Assets.icons.iArrowDown,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
