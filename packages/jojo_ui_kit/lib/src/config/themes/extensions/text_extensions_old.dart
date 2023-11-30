import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/src/config/config.dart';

@Deprecated('Use TextExt')
class TextExtension extends ThemeExtension<TextExtension> {
  const TextExtension({
    this.bigTitle = TextStyles.bigTitle,
    this.mainTitle = TextStyles.mainTitle,
    this.mainTitleMedium = TextStyles.mainTitleMedium,
    this.smallTitle = TextStyles.smallTitle,
    this.smallTitleMedium = TextStyles.smallTitleMedium,
    this.numbers = TextStyles.numbers,
    this.mainText = TextStyles.mainText,
    this.smallText = TextStyles.smallText,
    this.ultraSmallText = TextStyles.ultraSmallText,
    this.mainTextMedium = TextStyles.mainTextMedium,
    this.chatText = TextStyles.chatText,
    this.cap = TextStyles.cap,
  });

  final TextStyle bigTitle;
  final TextStyle mainTitle;
  final TextStyle mainTitleMedium;
  final TextStyle smallTitle;
  final TextStyle smallTitleMedium;
  final TextStyle numbers;
  final TextStyle mainText;
  final TextStyle mainTextMedium;
  final TextStyle smallText;
  final TextStyle ultraSmallText;
  final TextStyle chatText;
  final TextStyle cap;

  @override
  ThemeExtension<TextExtension> copyWith({
    TextStyle? bigTitle,
    TextStyle? mainTitle,
    TextStyle? mainTitleMedium,
    TextStyle? smallTitle,
    TextStyle? smallTitleMedium,
    TextStyle? numbers,
    TextStyle? mainText,
    TextStyle? mainTextMedium,
    TextStyle? smallText,
    TextStyle? ultraSmallText,
    TextStyle? chatText,
    TextStyle? cap,
  }) {
    return TextExtension(
      bigTitle: bigTitle ?? this.bigTitle,
      mainTitle: mainTitle ?? this.mainTitle,
      mainTitleMedium: mainTitleMedium ?? this.mainTitleMedium,
      smallTitle: smallTitle ?? this.smallTitle,
      smallTitleMedium: smallTitleMedium ?? this.smallTitleMedium,
      numbers: numbers ?? this.numbers,
      mainText: mainText ?? this.mainText,
      mainTextMedium: mainTextMedium ?? this.mainTextMedium,
      smallText: smallText ?? this.smallText,
      ultraSmallText: ultraSmallText ?? this.ultraSmallText,
      chatText: chatText ?? this.chatText,
      cap: cap ?? this.cap,
    );
  }

  @override
  ThemeExtension<TextExtension> lerp(
    ThemeExtension<TextExtension>? other,
    double t,
  ) {
    if (other is! TextExtension) {
      return this;
    }
    return const TextExtension();
  }

  static TextExtension get light => TextExtension(
        mainText: TextStyles.mainText.copyWith(
          color: ThemeConfig.smallTextColor,
        ),
      );
}
