import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

part 'welcome_cubit.freezed.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> implements AbstractRegisterStep {
  WelcomeCubit({
    required SignUpRepository repository,
    required GetUserCase getUserCase,
    required SignUpRouter router,
    required NotifyService notifyService,
  })  : _repository = repository,
        _getUserCase = getUserCase,
        _router = router,
        _notifyService = notifyService,
        super(const WelcomeState.initial());

  static StepEnum id = StepEnum.welcome;

  final SignUpRepository _repository;

  final SignUpRouter _router;

  final GetUserCase _getUserCase;

  final NotifyService _notifyService;

  final FormControl<String> formControl = FormControl<String>(
    validators: <Validator<dynamic>>[Validators.required],
  );

  late void Function([AuthenticatedUser? data, StepEnum? id]) _onFinish;

  StreamSubscription<AuthenticatedUser>? _stream;

  Future<void> _save() async {
    final result = await _repository.setComplete();

    await result.fold((error) {
      _notifyService.showError(error.message ?? '');
    }, (r) async {
      _onFinish();

// TODO afurmanchuk FIX IT
      await CoreSL.sl<AuthManager<AuthenticatedUser>>().verify();

      _router.goToMain();
    });
  }

  @override
  List<StepWidget> children() => <StepWidget>[
        StepWidget(
          typingDuration: 1000,
          readingDuration: 3000,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(content: SignUpI18n.timeCheckMessage),
        ),
        StepWidget(
          typingDuration: 1000,
          readingDuration: 5000,
          child: const UiMessage(isTyping: true),
          replaceChild: UiMessage(
            content: SignUpI18n.plusDateMessage,
          ),
        ),
        StepWidget(
          typingDuration: 1000,
          readingDuration: 0,
          child: const UiMessage(isTyping: true),
          replaceChild: UiButton(
            text: SignUpI18n.welcomeNextBtn,
            suffixIcon: UiIcon(Assets.icons.iArrowRight),
            onPressed: _save,
          ),
        ),
      ];

  @override
  Future<void> init(
    StepEnum? initStep,
    void Function(
      List<StepWidget>? children, {
      bool useDuration,
    }) addChildren,
    void Function([AuthenticatedUser? data, StepEnum? id]) onFinish,
  ) async {
    _onFinish = onFinish;

    final result = await _getUserCase(NoParams());

    _stream = result.listen(
      (user) {
        if (state.status.isPure) {
          addChildren(children(), useDuration: initStep != id);

          emit(
            state.copyWith(
              user: user,
              status: StateStatus.fetchingSuccess,
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() async {
    await _stream?.cancel();
    await super.close();
  }
}
