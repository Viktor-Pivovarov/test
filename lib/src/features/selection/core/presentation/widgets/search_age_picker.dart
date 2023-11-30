import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/_features.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class SearchAgePicker extends StatefulWidget {
  const SearchAgePicker({
    required this.from,
    required this.to,
    super.key,
    this.onSubmit,
  });

  final int from;
  final int to;

  final void Function(int from, int to)? onSubmit;

  @override
  State<SearchAgePicker> createState() => _SearchAgePickerState();
}

class _SearchAgePickerState extends State<SearchAgePicker> {
  bool isLoading = false;

  late int from;
  late int to;

  @override
  void initState() {
    super.initState();

    from = widget.from;
    to = widget.to;
  }

  void onChange(int _from, int _to) {
    setState(() {
      from = _from;
      to = _to;
    });
  }

  void _save() {
    setState(() {
      isLoading = true;
    });

    widget.onSubmit?.call(from, to);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(Insets.l),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              UiAgePicker(
                labelFrom: '${SignUpI18n.fromLabel}:',
                labelTo: '${SignUpI18n.toLabel}:',
                onChange: onChange,
                defaultFrom: from,
                defaultTo: to,
              ),
              UiButton(
                padding: const EdgeInsets.only(bottom: Insets.xxl),
                onPressed: _save,
                disabled: isLoading,
                text: CoreI18n.save,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
