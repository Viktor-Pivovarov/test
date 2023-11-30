import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// By entering you agree to the `Terms of Use` & `Privacy Policy`
/// [TextSpan(text: 'By entering you agree to the '),
/// TextSpan(text: 'Terms of Use',
///           style: TextStyle(color: context.color.mainAccentColor),
///           recognizer: TapGestureRecognizer()
///           ..onTap = callbacks.elementAt(index),]
/// ),
/// TextSpan(text: ' & '),
/// TextSpan(
///  text: 'Privacy Policy',
///  style: TextStyle(color: context.color.mainAccentColor),
///  recognizer: TapGestureRecognizer()
///    ..onTap = delegate.onPressedPrivacyPolicy,
/// ),]
List<TextSpan> parseToLinks(
  String text,
  List<Function> callbacks,
  Color primaryColor,
) {
  final RegExp regex = RegExp('`[^`]+`');

  // ignore: prefer_asserts_with_message
  assert(regex.allMatches(text).length == callbacks.length);

  final List<RegExpMatch> items = regex.allMatches(text).toList();

  return text.split('`').asMap().entries.map((MapEntry<int, String> e) {
    if (e.key.isOdd) {
      final int index = items.indexWhere(
        (RegExpMatch element) => element.group(0) == '`${e.value}`',
      );

      return TextSpan(
        text: e.value,
        style: TextStyle(color: primaryColor),
        recognizer: TapGestureRecognizer()
          // ignore: avoid_dynamic_calls
          ..onTap = () => callbacks.elementAt(index)(),
      );
    }

    return TextSpan(text: e.value);
  }).toList();
}
