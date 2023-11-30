import 'package:app_settings/app_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';
part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit({
    required this.loginUseCase,
    required this.goToSignUpCase,
    required this.popCase,
    required this.signOutUseCase,
    required this.signUpCase,
    required this.notifyService,
    required this.router,
    required this.manager,
    required this.repository,
    required this.geoLocationRouter,
  }) : super(const AuthState());

  final LoginUseCase loginUseCase;

  final SignOutUseCase signOutUseCase;

  final GoToAuthSignUpCase goToSignUpCase;

  final SignUpCase signUpCase;

  final NotifyService notifyService;

  final AuthRepository<AuthResponseModel, AuthenticatedUser> repository;

  final PopCase popCase;

  final AuthRouter router;

  final GeoLocationRouter geoLocationRouter;

  final AuthManager<AuthenticatedUser> manager;

  final FirebaseService _firebaseService = FirebaseService();

  // TODO(afurmanchuk): Only for debug
  Future<void> onPressedSystemDialog({bool useFastRegistration = false}) async {
    await DialogService.showFullscreenDialog<dynamic>(
      dialog: UiSystemDialog(
        manager: manager,
        router: router,
        useFastRegistration: useFastRegistration,
      ),
    );
  }

  Future<void> init() async {
    if (state.type == null) {
      // signOut();

      await router.replaceNamed(RoutePath.auth);

      return;
    }

    final result = await manager.init();

    result.fold((error) {
      if (error.code == 403) {
        signOut();

        router.replaceNamed(RoutePath.auth);
      } else if (error.code == 401) {
        router.replaceNamed(RoutePath.auth);
      } else {
        emit(
          state.copyWith(
            status: StateStatus.fetchingFailure,
            error: error.message.toString(),
          ),
        );
      }
    }, (state) {
      switch (state) {
        case AuthStage.pure:
          return;
        case AuthStage.onboarding:
          _initOnboarding();

        case AuthStage.auth:
          router.replaceNamed(RoutePath.auth);
        case AuthStage.city:
          router.replaceNamed(AuthRoutePath.geoLocation);
        case AuthStage.register:
          router.replaceNamed(RoutePath.authSignUpSteps);
        case AuthStage.completed:
          router.replaceNamed(RoutePath.main);
      }
    });
  }

  void _initOnboarding() {
    router.replaceNamed(AuthRoutePath.greetings);

    if (state.consent == null) {
      return;
    }

    router.goToSex();

    if (state.gender == null) {
      return;
    }

    router.goToAstrological();

    if (state.agreeForVedic == null) {
      return;
    }

    router.goToVerification();

    if (state.agreeForSelfie == null) {
      return;
    }

    router.goToNotification();

    if (state.pickupTime == null) {
      return;
    }

    router.goToPayment();

    if (state.agreeForPay == null) {
      return;
    }
  }

  void onPressedSignUp(OnResult? onResult) {
    onResult?.call(false);

    router.goToGreetings();
  }

  void setError(String? error) {
    emit(state.copyWith(error: error, status: StateStatus.fetchingFailure));
  }

  void removeError() {
    emit(state.copyWith(error: null, status: StateStatus.fetchingSuccess));
  }

  Future<void> onPressedAuthByType(
    SignUpType type,
    OnResult? onResult,
  ) async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final completer = notifyService.showLoader();

    final result = await loginUseCase.call(
      LoginUseCaseParam(
        type: type,
        onResult: onResult,
      ),
    );

    completer.complete();

    result.fold<void>(
      (failure) {
        if (failure.message != null && failure.message!.isNotEmpty) {
          notifyService.showError(failure.message ?? '');
        }

        setError(failure.message);
      },
      (response) {
        emit(state.copyWith(type: type, status: StateStatus.fetchingSuccess));

        if (response.expiresIn == '0') {
          onPressedSignUp(onResult);
        } else {
          init();
        }
      },
    );
  }

  void onPressedPrivacyPolicy() {
    // TODO(afurmanchuk): implement onPressedPrivacyPolicy
  }

  void onPressedTermsOfUse() {
    // TODO(afurmanchuk): implement onPressedTermsOfUse
  }

  void signOut() {
    signOutUseCase(NoParams());

    emit(const AuthState());
  }

  void onPressedGreetings({required bool consent}) {
    emit(state.copyWith(consent: consent));

    router.goToSex();
  }

  void onPressedLgbt() {
    router.goToLgbt();
  }

  void onPressedSex(Gender gender) {
    emit(state.copyWith(gender: gender));

    router.goToAstrological();
  }

  void onPressedAstrological(bool value) {
    emit(state.copyWith(agreeForVedic: value));

    router.goToVerification();
  }

  void onPressedTimeToNotify(PickupTime value) {
    emit(state.copyWith(pickupTime: value));

    router.goToPayment();
  }

  Future<void> onPressedContinueRegistration({bool canContinue = false}) async {
    if (canContinue) {
      emit(state.copyWith(agreeForPay: canContinue));

      final completer = notifyService.showLoader();

      String? oAuthToken = await manager.oAuthToken;

      if (oAuthToken == null) {
        final result = await manager.signIn(state.type!);

        result.fold((error) {
          signOut();
        }, (response) {
          oAuthToken = response.accessToken;
        });
      }

      await signUpCase(
        SignUpCaseParams(
          token: oAuthToken!,
          gender: state.gender!,
          pickupTime: state.pickupTime!,
          agreeForVedic: state.agreeForVedic!,
          agreeForPay: state.agreeForPay!,
          agreeForSelfie: state.agreeForSelfie!,
        ),
      );

      completer.complete();

      await Future<void>.delayed(const Duration(milliseconds: 666));

      router.goToGeoLocation();
    }
  }

  void onPressedConfirmPayment(bool value) {
    emit(state.copyWith(agreeForPay: value));

    if (!value) {
      router.goToPaymentNotReady();
    } else {
      onPressedContinueRegistration(canContinue: value);
    }
  }

  void onPressedReadyToBeTested(bool value) {
    emit(state.copyWith(agreeForSelfie: value));

    if (!value) {
      router.goToVerificationNotReady();
    } else {
      router.goToNotification();
    }
  }

  void clearGeoLocation() {
    emit(state.copyWith(geoLocationEnabled: null));
  }

  Future<void> onPressedEnableGeoLocation() async {
    try {
      if (state.locationPermission != null) {
        if (state.locationPermission == LocationPermission.unableToDetermine) {
          await Geolocator.openLocationSettings();
        } else {
          await Geolocator.openAppSettings();
        }
      } else {
        await AppSettings.openAppSettings(type: AppSettingsType.location);
      }
    } catch (_) {
      await notifyService.showError(SignInI18n.appSettingsError);
    }
  }

  Future<void> onPressedSelectCity() async {
    final location = await geoLocationRouter.goToGeoLocation(needHelp: true);

    if (location != null) {
      await repository.setLocationCoordinate(
        LocationDTO(
          coordinate: PositionDTO(
            longitude: location.longitude!,
            latitude: location.latitude!,
          ),
        ),
      );

      emit(
        state.copyWith(
          status: StateStatus.fetchingSuccess,
          latitude: location.latitude,
          longitude: location.longitude,
        ),
      );

      router.goToCheckNotifications();
    }
  }

  Future<void> onPressedEnableNotification() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    try {
      await _firebaseService.requestPermission();
      await _firebaseService.setForegroundNotificationPresentationOptions();

      final String? token = await _firebaseService.getToken();

      emit(state.copyWith(status: StateStatus.fetchingSuccess));

      if (token == null) {
        return;
      }

      await repository.visitInitialize(token);
      await repository.setNotificationAllowed(true);

      router.goToSignUp();
    } catch (_) {
      setError(_.toString());
    }
  }

  Future<void> onPressedGeoLocation() async {
    emit(
      state.copyWith(
        status: StateStatus.fetchingInProgress,
      ),
    );

    try {
      final result = await determinePosition();

      await repository.setLocationCoordinate(
        LocationDTO(
          coordinate: PositionDTO(
            longitude: result.longitude,
            latitude: result.latitude,
          ),
        ),
      );

      emit(
        state.copyWith(
          status: StateStatus.fetchingSuccess,
          latitude: result.latitude,
          longitude: result.longitude,
        ),
      );

      router.goToCheckNotifications();
    } catch (_) {
      if (_ is LocationPermission) {
        emit(
          state.copyWith(
            status: StateStatus.fetchingFailure,
            locationPermission: _,
            geoLocationEnabled: false,
          ),
        );
      }
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      return AuthState.fromJson(json).copyWith(
        status: StateStatus.fetchingSuccess,
        error: null,
      );
    } catch (_) {
      return const AuthState();
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}
