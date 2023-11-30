import 'package:flutter/material.dart';
import 'package:jojo/src/features/chat/_chat.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiChatDateSeparator extends StatelessWidget {
  const UiChatDateSeparator({super.key, this.date});

  final DateTime? date;

  String? get _dayDateFormatted {
    if (date == null) {
      return null;
    }

    if (DateHelper.isToday(date!)) {
      return ChatI18n.today;
    }

    if (DateHelper.isYesterday(date!)) {
      return ChatI18n.yesterday;
    }

    return DateHelper.formatToYMD(date!);
  }

  @override
  Widget build(BuildContext context) {
    if (_dayDateFormatted == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Insets.l,
        Insets.s,
        Insets.l,
        Insets.l,
      ),
      child: Text(
        _dayDateFormatted ?? '',
        style: context.texts.body.base
            .copyWith(color: context.colors.text.secondary),
      ),
    );
  }
}
