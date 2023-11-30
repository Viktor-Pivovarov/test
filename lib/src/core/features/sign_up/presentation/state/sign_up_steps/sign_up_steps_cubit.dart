import 'package:async_queue/async_queue.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'sign_up_steps_cubit.freezed.dart';

part 'sign_up_steps_state.dart';

typedef SignUpSteps = Map<StepEnum, AbstractRegisterStep>;

class SignUpStepsCubit extends BaseCubit<SignUpStepsState> {
  SignUpStepsCubit({
    required SignUpRepository signUpRepository,
    required AuthManager<AuthenticatedUser> authManager,
    required SignOutCase signOutCase,
    required SignUpSteps steps,
  })  : _signUpRepository = signUpRepository,
        _authManager = authManager,
        _steps = steps,
        _signOutCase = signOutCase,
        super(
          SignUpStepsState.initial(
            steps: steps,
            currentStep: StepEnum.firstName,
            user: authManager.user,
          ),
        );

  late final AuthManager<AuthenticatedUser> _authManager;

  final SignUpRepository _signUpRepository;

  final SignOutCase _signOutCase;

  final SignUpSteps _steps;

  final AsyncQueue _queue = AsyncQueue.autoStart();

  Future<bool> onWillPop(OnResult? onResult) async {
    onResult?.call(false);

    final dialog = DialogTypes.logout(
      title: CoreI18n.signOut,
      btnCancelTitle: CoreI18n.no,
      btnOkTitle: CoreI18n.yes,
    );

    final bool? result = await dialog.show();

    if (result is bool) {
      await _signOutCase(NoParams());

      return result;
    }

    return false;
  }

  void setCurrentStep(StepEnum currentStep) {
    emit(state.copyWith(currentStep: currentStep));
  }

  void removeItem() {
    final List<Widget> _items = <Widget>[...state.items]..removeAt(0);

    // _items.removeAt(0);
    state.messagesKey?.currentState?.removeItem(
      0,
      (BuildContext context, Animation<double> animation) => Container(),
    );

    emit(state.copyWith(items: _items));
  }

  Future<void> _updateMessage(
    StepWidget item, [
    bool useDuration = false,
  ]) async {
    if (useDuration) {
      await Future<dynamic>.delayed(
        Duration(milliseconds: item.typingDuration),
      );
    }

    if (item.replaceChild != null) {
      removeItem();

      _addItem(item.replaceChild!);
    }

    if (item.readingDuration != null && useDuration) {
      await Future<dynamic>.delayed(
        Duration(milliseconds: item.readingDuration!),
      );
    }
  }

  Future<void> _add(StepWidget item, [bool useDuration = false]) async {
    _addItem(item.child);

    await _updateMessage(item, useDuration);
  }

  void _addItem(Widget item) {
    List<Widget> _items = <Widget>[...state.items];

    _items = <Widget>[item, ..._items];

    state.messagesKey?.currentState?.insertItem(0);

    emit(state.copyWith(items: _items));
  }

  void insertItem(StepWidget element, {bool useDuration = false}) {
    _queue.addJob(() => _add(element, useDuration));
  }

  void _addChildren(List<StepWidget>? children, {bool useDuration = false}) {
    if (children != null) {
      for (final StepWidget stepWidget in children) {
        insertItem(stepWidget, useDuration: useDuration);
      }
    }
  }

  Future<void> init(GlobalKey<AnimatedListState> messagesKey) async {
    emit(
      state.copyWith(
        status: StateStatus.fetchingInProgress,
        user: _authManager.user,
      ),
    );

    final result = await _signUpRepository.getWorksheetSteps();

    result.fold(
      (l) {
        emit(state.copyWith(status: StateStatus.fetchingFailure));
      },
      (WorksheetStepsResponseModel response) {
        emit(
          state.copyWith(
            currentStep: response.steps.first.step,
            availableSteps: response.steps,
            messagesKey: messagesKey,
            status: StateStatus.fetchingSuccess,
            initStep: response.currentStep,
          ),
        );

        _start(state.currentStep, response.currentStep);

        //TODO-Pavlov test?.init(_addChildren, defaultData, onFinish )

        // _addChildren(firstStep?.children(), true);

        // insertItem(SignUpStepsConstants.steps.values[], false);

        // emit(state.copyWith(messagesKey: messagesKey));

        // final int stepIndex = state.registerSteps.indexWhere(
        //     (RegisterStep element) => element.id == state.registerStepId);

        // bool isAnimate = stepIndex == 0;
        // bool isAnimate = false;
        //
        // _addChildren(welcomeStep.children(state.user), isAnimate);
        //
        // for (int i = 0; i <= stepIndex; i++) {
        //   RegisterStep element = state.registerSteps[i];
        //
        //   // bool isAnimate = i > 8;
        //
        //   _addChildren(state.steps[element.id]?.children(state.user), isAnimate);
        //
        //   state.steps[element.id]?.isEditing = i == stepIndex;
        //   state.steps[element.id]?.validate(state.user);
        //
        //   if (element.id == EstimatedCandidatesStep.id) {
        //     _fetchEstimateCandidates();
        //   }

        // if (element.id == ExamStep.id) {
        //   initExamStep(false);
        // }
        // }
        //
        // _setIsLoading(false);
      },
    );
  }

  void _start(StepEnum currentStep, StepEnum? initStep) {
    final _step = _steps[state.availableSteps
        .firstWhereOrNull((element) => element.step == currentStep)
        ?.step];

    _step?.init(
      initStep,
      _addChildren,
      _onFinish,
    );
  }

  Future<void> _onFinish([AuthenticatedUser? user, StepEnum? id]) async {
    final availableSteps = state.availableSteps;
    final currentStep = state.currentStep;

    if (user != null) {
      _authManager.user = user;

      emit(
        state.copyWith(
          user: user,
        ),
      );
    }

    if (currentStep == StepEnum.complete) {
      return;
    }

    if (id != null && currentStep != id) {
      return;
    }

    for (int i = 0; i <= availableSteps.length; i++) {
      if (availableSteps.elementAt(i).step == currentStep) {
        final nextStep = availableSteps.elementAt(i + 1).step;
        setCurrentStep(nextStep);
        _start(nextStep, state.initStep);
        return;
      }
    }
  }
}
