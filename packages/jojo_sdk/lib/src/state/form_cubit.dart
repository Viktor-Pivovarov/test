import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:xander9112/xander9112.dart';

abstract class FormCubit<T> extends BaseCubit<T> {
  FormCubit(super.initialState);

  late final FormGroup form;

  final List<StreamSubscription<dynamic>> streamSubscriptions = [];

  AbstractControl<T> getFormControl<T>(String name) {
    return form.control(name) as AbstractControl<T>;
  }

  void addListener(StreamSubscription<dynamic> listener) {
    streamSubscriptions.add(listener);
  }

  @mustCallSuper
  Future<void> onSubmit() async {
    await validate();
  }

  @mustCallSuper
  Future<void> validate() async {
    form.markAllAsTouched();
  }

  @override
  Future<void> close() {
    for (final element in streamSubscriptions) {
      element.cancel();
    }

    return super.close();
  }
}
