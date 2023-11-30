import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

abstract class AbstractRegisterStep {
  static late StepEnum id;

  void init(
    StepEnum? initStep,
    void Function(List<StepWidget>? children, {bool useDuration}) addChildren,
    void Function([AuthenticatedUser? data, StepEnum? id]) onFinish,
  );

  List<StepWidget> children() => <StepWidget>[];

  @override
  String toString() {
    return '{}';
  }
}
