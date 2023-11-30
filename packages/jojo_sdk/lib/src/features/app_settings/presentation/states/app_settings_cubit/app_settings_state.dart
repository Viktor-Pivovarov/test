part of 'app_settings_cubit.dart';

@freezed
class AppSettingsState with _$AppSettingsState {
  const factory AppSettingsState({
    required AppInfoModel appInfo,
    required DeviceInfoModel deviceInfo,
    required String? deviceId,
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    String? selectedLocaleCode,
    String? deviceLocaleCode,
    @Default(
      AppSettingsModel(
        engineeringWorks: EngineeringWorksModel(),
        latestApplicationVersions: LatestApplicationVersionsModel(),
      ),
    )
    AppSettingsModel appSettings,
  }) = _AppSettingsInitialState;

  factory AppSettingsState.fromJson(Object? json) =>
      _$AppSettingsStateFromJson(json! as Map<String, dynamic>);

  const AppSettingsState._();

  @override
  Map<String, dynamic> toJson();

  bool get engineeringWorks {
    if (Platform.isIOS) {
      return appSettings.engineeringWorks.ios;
    }

    return appSettings.engineeringWorks.android;
  }

  bool get hasUpdate {
    final List<int> local = localVersion.split('.').map(int.parse).toList();
    final List<int> store = storeVersion.split('.').map(int.parse).toList();

    for (int i = 0; i < store.length; i++) {
      if (store[i] > local[i]) {
        return true;
      }

      if (local[i] > store[i]) {
        return false;
      }
    }

    return false;
  }

  bool get requireUpdate {
    final List<int> local = localVersion.split('.').map(int.parse).toList();
    final List<int> store = storeVersion.split('.').map(int.parse).toList();

    return (store[1] > local[1]) || (store[0] > local[0]);
  }

  String get storeVersion {
    if (Platform.isIOS) {
      return appSettings.latestApplicationVersions.ios;
    }

    return appSettings.latestApplicationVersions.android;
  }

  String get localVersion => appInfo.version;

  Locale? get locale =>
      selectedLocaleCode != null ? Locale(selectedLocaleCode!) : null;

  Locale _localeFromJson(String? value) {
    // if (value == null) {
    //   return AppLocalizations.supportedLocales.first;
    // }

    final intlLocale = Locale(value!);

    return Locale.fromSubtags(
      languageCode: intlLocale.languageCode,
      countryCode: intlLocale.countryCode,
      scriptCode: intlLocale.scriptCode,
    );
  }

  String _localeToJson(Locale? locale) {
    if (locale == null) return 'en';

    final localName = locale.countryCode == null || locale.countryCode!.isEmpty
        ? locale.languageCode
        : locale.toString();

    return Intl.canonicalizedLocale(localName);
  }
}
