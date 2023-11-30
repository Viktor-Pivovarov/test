// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_supporting/jojo_supporting.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'supporting_cubit.freezed.dart';
part 'supporting_state.dart';

class SupportingCubit extends Cubit<SupportingState> {
  SupportingCubit({
    required CreateRequestUseCase createRequestUseCase,
    required GetProfileEmailUseCase getProfileEmailUseCase,
    required NotifyService notifyService,
  })  : _createRequestUseCase = createRequestUseCase,
        _getProfileEmailUseCase = getProfileEmailUseCase,
        _notifyService = notifyService,
        super(const SupportingState.loading());

  final CreateRequestUseCase _createRequestUseCase;
  final GetProfileEmailUseCase _getProfileEmailUseCase;

  final NotifyService _notifyService;

  final FormGroup formGroup = FormGroup(
    {
      emailSupportingFormKey: FormControl<String>(
        validators: [Validators.email, Validators.required],
      ),
      descriptionSupportingFormKey: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(10),
          Validators.maxLength(500),
        ],
        value: '',
      ),
    },
  );

  bool locked = false;

  Future<void> init() async {
    emit(SupportingState.loaded(formGroup: formGroup));
    final email = await _getProfileEmailUseCase(NoParams());
    if (email.isNotEmpty) {
      formGroup.control(emailSupportingFormKey).value = email;
    }
  }

  Future<void> onSubmit(BuildContext context) async {
    if (formGroup.valid && !locked) {
      locked = true;
      final result = await _createRequestUseCase(
        SupportingModel(
          email: formGroup.value[emailSupportingFormKey]! as String,
          message: formGroup.value[descriptionSupportingFormKey]! as String,
        ),
      );

      await result.fold((failure) {
        locked = false;
        _notifyService.showError(SupportingI18n.defaultError);
      }, (success) async {
        locked = false;

        final dialog = DialogTypes.supporting();

        await dialog.show();

        if (context.mounted) {
          await AutoRouter.of(context).pop(true);
        }
      });
    }
  }
}
