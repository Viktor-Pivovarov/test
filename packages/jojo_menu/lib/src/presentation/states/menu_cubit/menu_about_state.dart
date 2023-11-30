part of 'menu_about_cubit.dart';

@freezed
class MenuAboutState with _$MenuAboutState {
  const factory MenuAboutState({
    @Default(StateStatus.pure) StateStatus status,
    String? error,
    AppInfoModel? appInfo,
    @Default([]) List<ThirdPartyLinkModel> links,
  }) = _MenuAboutState;

  factory MenuAboutState.fromJson(Object? json) =>
      _$MenuAboutStateFromJson(json! as Map<String, dynamic>);

  const MenuAboutState._();

  ThirdPartyLinkModel? get userAgreement =>
      links.singleWhereOrNull((element) => element.code == 'userAgreement');

  ThirdPartyLinkModel? get processingOfPersonalData => links.singleWhereOrNull(
        (element) => element.code == 'processingOfPersonalData',
      );
  ThirdPartyLinkModel? get privacyPolicy =>
      links.singleWhereOrNull((element) => element.code == 'privacyPolicy');

  @override
  Map<String, dynamic> toJson();
}
