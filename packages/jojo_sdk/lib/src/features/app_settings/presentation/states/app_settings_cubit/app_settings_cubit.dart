import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'app_settings_cubit.freezed.dart';
part 'app_settings_cubit.g.dart';
part 'app_settings_state.dart';

class AppSettingsCubit extends HydratedCubit<AppSettingsState> {
  AppSettingsCubit({
    required this.appInfo,
    required this.deviceInfo,
    required this.deviceId,
    required AppSettingsRepository repository,
    required AppMetrics appMetrics,
  })  : _repository = repository,
        _appMetrics = appMetrics,
        super(
          AppSettingsState(
            appInfo: appInfo,
            deviceInfo: deviceInfo,
            deviceId: deviceId,
          ),
        ) {
    // subscriptAuthEventUseCase(refresh);
  }

  final AppInfoModel appInfo;

  final DeviceInfoModel deviceInfo;

  final String? deviceId;

  final AppSettingsRepository _repository;

  final AppMetrics _appMetrics;

  Future<void> init() async {
    _appMetrics.deviceId = deviceId;

    await getAppSettings();
  }

  Future<void> check() async {
    if (state.engineeringWorks) {
      await showEngineeringWorksDialog();
    }

    if (state.hasUpdate) {
      await showUpdateDialog();
    }
  }

  void setDeviceLocale(Locale locale) {
    if (state.selectedLocaleCode == null) {
      emit(
        state.copyWith(
          deviceLocaleCode: locale.languageCode,
          selectedLocaleCode: locale.languageCode,
        ),
      );
    }
  }

  Future<void> refresh() async {
    // final isAuth = await getAuthUseCase(NoParams());

    // final globalAuthSettings = await getGlobalAuthSettings(NoParams());

    // bool? useBiometric = false;

    // if (globalAuthSettings.useBiometric == false) {
    //   useBiometric = null;
    // } else {
    //   final biometricSupportModel = await getBiometricSupportModel(NoParams());
    //   if (biometricSupportModel.status == BiometricStatus.available) {
    //     useBiometric = biometricSupportModel.useBiometric ?? false;
    //   }
    // }

    // if (isAuth) {
    //   _safeEmit(
    //     state.copyWith(
    //       useBiometric: useBiometric,
    //       useLocalAuth: globalAuthSettings.useLocalAuth,
    //     ),
    //   );
    // } else {
    //   _safeEmit(
    //     state.copyWith(
    //       appThemeMode: null,
    //       useBiometric: useBiometric,
    //       useLocalAuth: globalAuthSettings.useLocalAuth,
    //     ),
    //   );
    // }

    // await getFeatureToggles();
  }

  void setLocale(Locale? locale) {
    emit(
      state.copyWith(
        selectedLocaleCode: locale?.languageCode,
      ),
    );
  }

  Future<void> getAppSettings() async {
    emit(state.copyWith(status: StateStatus.fetchingInProgress));

    final result = await _repository.getAppSettings();

    await result.fold((l) => null, (r) async {
      emit(
        state.copyWith(
          appSettings: r,
          status: StateStatus.fetchingSuccess,
        ),
      );
    });

    await Future.microtask(() => null);
  }

  Future<void> getFeatureToggles() async {
    // final result = await appSettings.getFeatureToggles();

    // result.fold(Left.new, (response) {
    //   _safeEmit(state.copyWith(featureToggles: response));
    // });
  }

  Future<void> _checkAppSettings(StreamController<StateStatus> stream) async {
    stream.sink.add(StateStatus.fetchingInProgress);

    await getAppSettings();

    if (state.engineeringWorks) {
      stream.sink.add(StateStatus.fetchingFailure);
    } else {
      stream.sink.add(StateStatus.fetchingSuccess);
    }
  }

  Future<void> showUpdateDialog() async {
    final result = await UpdateDialog(isFullScreen: state.requireUpdate).show();

    if (result ?? false) {
      await launchURL(
        JoJoSDKConstants.getUrlStore,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Future<void> showEngineeringWorksDialog() async {
    final _stream = StreamController<StateStatus>();

    final engineeringWorksDialog = EngineeringWorksDialog(
      onPressedButton: () => _checkAppSettings(_stream),
      stream: _stream,
    );

    await engineeringWorksDialog.show();
  }

  Future<void> updateLastVisit() async {
    // await _repository.updateLastVisit();
  }

  // Future<Either<Failure, void>> setFirebaseId(String token) {
  //   return _repository.setFirebaseId(token);
  // }

  Future<void> updateDeviceVersion() async {
    // await _repository.updateDeviceVersion(
    //   deviceModel: deviceInfo.model,
    //   deviceSystem: deviceInfo.system,
    //   deviceVersion: deviceInfo.version,
    //   appVersion: appInfo.version,
    //   appBuild: appInfo.buildNumber,
    // );
  }

  void _safeEmit(AppSettingsState newState) {
    // if (!isClosed) {
    emit(newState);
    // }
  }

  Future<void> onPressedLanguage() async {
    // final String? action = await _dialogService.showBottomModal(
    //   actions: AppLocalizations.supportedLocales.map((e) {
    //     return BottomModalAction(
    //       child: Text(e.toString()),
    //       action: e.languageCode,
    //       isSelected: state.locale == e,
    //     );
    //   }).toList(),
    // );

    // if (action != null) {
    //   setLocale(Locale(action));
    // }
  }

  @override
  AppSettingsState? fromJson(Map<String, dynamic> json) {
    return AppSettingsState.fromJson(json).copyWith(
      appInfo: appInfo,
      deviceInfo: deviceInfo,
    );
  }

  @override
  Map<String, dynamic>? toJson(AppSettingsState state) {
    return state.toJson();
  }
}
