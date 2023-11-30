import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/src/config/config.dart';

class TextExt extends ThemeExtension<TextExt> {
  const TextExt.light({
    this.decor = const TextsStylesDecor(),
    this.headline = const TextsStylesHeadline(),
    this.title = const TextsStylesTitle(),
    this.button = const TextsStylesButton(),
    this.body = const TextsStylesBody(),
    this.footnote = const TextsStylesFootnote(),
    this.caption = const TextsStylesCaption(),
  }) : _isDark = false;

  const TextExt.dark({
    this.decor = const TextsStylesDecor(),
    this.headline = const TextsStylesHeadline(),
    this.title = const TextsStylesTitle(),
    this.button = const TextsStylesButton(),
    this.body = const TextsStylesBody(),
    this.footnote = const TextsStylesFootnote(),
    this.caption = const TextsStylesCaption(),
  }) : _isDark = true;

  final TextsStylesDecor decor;
  final TextsStylesHeadline headline;
  final TextsStylesTitle title;
  final TextsStylesButton button;
  final TextsStylesBody body;
  final TextsStylesFootnote footnote;
  final TextsStylesCaption caption;

  final bool _isDark;

  @override
  ThemeExtension<TextExt> copyWith({
    TextsStylesDecor? decor,
    TextsStylesHeadline? headline,
    TextsStylesTitle? title,
    TextsStylesButton? button,
    TextsStylesBody? body,
    TextsStylesFootnote? footnote,
    TextsStylesCaption? caption,
  }) {
    if (_isDark) {
      return TextExt.dark(
        decor: decor ?? this.decor,
        headline: headline ?? this.headline,
        title: title ?? this.title,
        button: button ?? this.button,
        body: body ?? this.body,
        footnote: footnote ?? this.footnote,
        caption: caption ?? this.caption,
      );
    }

    return TextExt.light(
      decor: decor ?? this.decor,
      headline: headline ?? this.headline,
      title: title ?? this.title,
      button: button ?? this.button,
      body: body ?? this.body,
      footnote: footnote ?? this.footnote,
      caption: caption ?? this.caption,
    );
  }

  @override
  ThemeExtension<TextExt> lerp(
    ThemeExtension<TextExt>? other,
    double t,
  ) {
    if (other is! TextExt) {
      return this;
    }

    if (_isDark) {
      return const TextExt.dark();
    }

    return const TextExt.light();
  }
}
