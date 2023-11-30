part of 'sign_up_steps_cubit.dart';

@freezed
class SignUpStepsState with _$SignUpStepsState {
  const factory SignUpStepsState.initial({
    required StepEnum currentStep,
    required AuthenticatedUser user,
    StepEnum? initStep,
    @Default(StateStatus.pure) StateStatus status,
    @Default(<Widget>[]) List<Widget> items,
    GlobalKey<AnimatedListState>? messagesKey,
    @Default(<StepEnum, AbstractRegisterStep>{})
    Map<StepEnum, AbstractRegisterStep> steps,
    @Default(<StepModel>[]) List<StepModel> availableSteps,
  }) = _Initial;

  const SignUpStepsState._();

  bool get showLoader => status.isFetchingInProgress && availableSteps.isEmpty;
}
