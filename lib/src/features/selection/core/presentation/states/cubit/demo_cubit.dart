import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'demo_state.dart';
part 'demo_cubit.freezed.dart';

class DemoFormFields {
  static const String distance = 'distance';
}

class DemoCubit extends FormCubit<DemoState> {
  DemoCubit() : super(const DemoState());

  void init() {
    form = FormGroup({
      DemoFormFields.distance: FormControl<int>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
    });

    addListener(
      getFormControl<int>(DemoFormFields.distance).valueChanges.listen(print),
    );
  }

  @override
  Future<void> onSubmit() async {
    await super.onSubmit();

    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    await Future<void>.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: StateStatus.finish));
  }
}
