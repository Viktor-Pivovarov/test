import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class CityDialog extends StatelessWidget {
  CityDialog({
    required this.city,
    required this.suggestions,
    required this.onSearchChanged,
    super.key,
  }) {
    selectedFormControl = FormControl<String>(
      validators: <Validator<dynamic>>[Validators.required],
    );

    searchFormControl = FormControl<String>(value: city.name);
    subscriptions = [searchFormControl.valueChanges.listen(onSearchChanged)];
  }

  late final List<StreamSubscription<String?>> subscriptions;

  late final FormControl<String> selectedFormControl;
  late final FormControl<String> searchFormControl;

  final List<CityModel> suggestions;
  final CityModel city;

  final void Function(String? value) onSearchChanged;

  void onChanged(String? value) {
    final CityModel? _city = suggestions
        .firstWhereOrNull((CityModel element) => element.name == value);

    if (_city != null) {
      selectedFormControl.value = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UiAppBar(
        title: Text('Место рождения'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 16,
            ),
            child: UiTextField<String>(
              formControl: searchFormControl,
              hintText: 'Найти город',
              autofocus: true,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: suggestions.map<Widget>((CityModel _city) {
                return UiRadioField<String>(
                  label: _city.name,
                  value: _city.name,
                  formControl: selectedFormControl,
                  onChanged: onChanged,
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomSheet: UiBottomSheet(
        child: UiButton(
          // TODO(Pavlov): добавить параметр isDisabled
          // isDisabled: city.name == null,
          text: 'Подтверждаю',
          onPressed: () {
            Navigator.pop(context, selectedFormControl.value);
          },
        ),
      ),
    );
  }
}
