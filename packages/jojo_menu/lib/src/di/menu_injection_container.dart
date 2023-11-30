import 'package:get_it/get_it.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_menu/src/data/data_sources/blacklist/remote_blacklist_datasource.dart';
import 'package:xander9112/xander9112.dart';

class MenuInjection extends ServiceLocator {
  static final GetIt sl = ServiceLocator.getSL;

  @override
  Future<void> initRouter() async {
    sl.registerFactory(() => MenuRouter(sl()));
  }

  @override
  Future<void> initProviders({EnvConfig? env, bool useMock = false}) async {
    final LocalDatingInfoDataSource localDatingInfoDataSource =
        HiveDatingInfoDatasource();
    final LocalThirdPartyLinkDataSource localThirdPartyLinkDataSource =
        HiveThirdPartyLinkDatasource();

    await Future.wait([
      localDatingInfoDataSource.init(),
      localThirdPartyLinkDataSource.init(),
    ]);

    if (useMock) {
      sl
        ..registerFactory<MenuDataSource>(
          MockMenuDataSource.new,
        )
        ..registerFactory<RemoteThirdPartyLinkDataSource>(
          () => RemoteThirdPartyLinkDataSource(
            sl<DioApiClient>().dio,
          ),
        )
        ..registerFactory<LocalThirdPartyLinkDataSource>(
          () => localThirdPartyLinkDataSource,
        )
        ..registerFactory<RemoteDatingInfoDataSource>(
          () => RemoteDatingInfoDataSource(
            sl<DioApiClient>().dio,
          ),
        )
        ..registerFactory<RemoteUserSettingsDatasource>(
          () => RemoteUserSettingsDatasource(
            sl<DioApiClient>().dio,
          ),
        )
        ..registerFactory<RemoteBlacklistDataSource>(
          () => RemoteBlacklistDataSource(sl<DioApiClient>().dio),
        )
        ..registerFactory(
          () => RemoteAccountStatusDataSource(sl<DioApiClient>().dio),
        )
        ..registerFactory(() => RemoteTariffDataSource(sl<DioApiClient>().dio))
        ..registerFactory(
          () => FeedbackRemoteDatasource(sl<DioApiClient>().dio),
        )
        ..registerFactory<LocalDatingInfoDataSource>(
          () => localDatingInfoDataSource,
        );
    } else {
      final LocalFaqDataSource localFaqDataSource = HiveFaqDatasource();

      await localFaqDataSource.init();
      sl
        ..registerFactory<LocalFaqDataSource>(() => localFaqDataSource)
        ..registerFactory(
          () => RemoteFaqDataSource(
            sl<DioApiClient>().dio,
          ),
        )
        ..registerFactory<MenuDataSource>(
          () => RestMenuDataSource(
            sl<DioApiClient>().dio,
          ),
        )
        ..registerFactory(
          () => RemoteAccountStatusDataSource(sl<DioApiClient>().dio),
        )
        ..registerFactory<RemoteDatingInfoDataSource>(
          () => RemoteDatingInfoDataSource(
            sl<DioApiClient>().dio,
          ),
        )
        ..registerFactory<RemoteUserSettingsDatasource>(
          () => RemoteUserSettingsDatasource(
            sl<DioApiClient>().dio,
          ),
        )
        ..registerFactory(
          () => FeedbackRemoteDatasource(sl<DioApiClient>().dio),
        )
        ..registerFactory<RemoteBlacklistDataSource>(
          () => RemoteBlacklistDataSource(sl<DioApiClient>().dio),
        )
        ..registerFactory(() => RemoteTariffDataSource(sl<DioApiClient>().dio))
        ..registerFactory<RemoteThirdPartyLinkDataSource>(
          () => RemoteThirdPartyLinkDataSource(
            sl<DioApiClient>().dio,
          ),
        )
        ..registerFactory<LocalThirdPartyLinkDataSource>(
          () => localThirdPartyLinkDataSource,
        )
        ..registerFactory<LocalDatingInfoDataSource>(
          () => localDatingInfoDataSource,
        );
    }
  }

  @override
  Future<void> initRepositories({EnvConfig? env, bool useMock = false}) async {
    sl
      ..registerFactory<MenuRepository>(() => MenuRepositoryImpl(sl()))
      ..registerFactory<VersionRepository>(VersionRepositoryImpl.new)
      ..registerFactory<FaqRepository>(
        () => FaqRepositoryImpl(
          localFaqDataSource: sl(),
          remoteFaqDataSource: sl(),
        ),
      )
      ..registerFactory<AccountStatusRepository>(
        () => AccountStatusRepositoryImpl(
          remoteAccountStatusDataSource: sl(),
        ),
      )
      ..registerFactory<ThirdPartyLinkRepository>(
        () => ThirdPartyLinkRepositoryImpl(
          localThirdPartyLinkDataSource: sl(),
          remoteThirdPartyLinkDataSource: sl(),
        ),
      )
      ..registerFactory<UserSettingsRepository>(
        () => UserSettingsRepositoryImpl(sl()),
      )
      ..registerFactory<FeedbackRepository>(() => FeedbackRepositoryImpl(sl()))
      ..registerFactory<TariffRepository>(
        () => TariffRepositoryImpl(remoteTariffDataSource: sl()),
      )
      ..registerFactory<BlacklistRepository>(
        () => BlacklistRepositoryImpl(remoteBlacklistDataSource: sl()),
      )
      ..registerFactory<DatingInfoRepository>(
        () => DatingInfoRepositoryImpl(
          localDatingInfoDataSource: sl(),
          remoteDatingInfoDataSource: sl(),
        ),
      );
  }

  @override
  Future<void> initUseCases({EnvConfig? env, bool useMock = false}) async {
    sl
      ..registerFactory(() => DeleteAccountUseCase(repository: sl()))
      ..registerFactory(
        () => FreezeAccountUseCase(
          repository: sl(),
        ),
      )
      ..registerFactory(
        () => GetAccountStatusUseCase(
          authManager: sl(),
        ),
      )
      ..registerFactory(
        () => UnfreezeAccountUseCase(
          repository: sl(),
        ),
      )
      ..registerFactory(() => GetUserSettingsUseCase(sl()))
      ..registerFactory(() => GetTariffsUseCase(sl()))
      ..registerFactory(() => GetAppInfoUseCase(sl()))
      ..registerFactory(() => GetFaqUseCase(sl()))
      ..registerFactory(() => SubscribeFaqUseCase(sl()))
      ..registerFactory(() => GetDatingInfoUseCase(sl(), sl()))
      ..registerFactory(() => GetThirdPartyLinksUseCase(sl()))
      ..registerFactory(
        () => GetReasonsForDeletionUseCase(sl()),
      )
      ..registerFactory(
        () => SetNotificationMutualSympathyOfferUseCase(
          userSettingsRepository: sl(),
        ),
      )
      ..registerFactory(
        () =>
            SetNotificationNewChatMessagesUseCase(userSettingsRepository: sl()),
      )
      ..registerFactory(
        () => SetNotificationNewStackOffer(userSettingsRepository: sl()),
      )
      ..registerFactory(() => GetBlacklistUseCase(sl()))
      ..registerFactory(() => BlockUserUseCase(sl()))
      ..registerFactory(() => UnblockUserUseCase(sl()))
      ..registerFactory(() => SendFeedbackUseCase(sl()))
      ..registerFactory(() => GetBonusesUseCase(sl()))
      ..registerFactory(() => SubscribeThirdPartyLinksUseCase(sl()))
      ..registerFactory(() => VerifyAccountStatusUseCase(authManager: sl()))
      ..registerFactory(() => GetFeedbackReasonsUseCase(sl()))
      ..registerFactory(() => SubscribeDatingInfoUseCase(sl(), sl()));
  }

  @override
  Future<void> initState({EnvConfig? env, bool useMock = false}) async {
    sl
      ..registerLazySingleton(
        () => MenuCubit(
          getDatingInfoUseCase: sl(),
          router: sl(),
        ),
      )
      ..registerFactory(
        () => MenuSupportingCubit(
          getFaqUseCase: sl(),
          subscribeFaqUseCase: sl(),
          router: sl(),
        ),
      )
      ..registerFactory(
        () => MenuAboutCubit(
          getAppInfoUseCase: sl(),
          getThirdPartyLinksUseCase: sl(),
          subscribeThirdPartyLinksUseCase: sl(),
          router: sl(),
        ),
      )
      ..registerFactory(
        () => MenuTariffCubit(getTariffsUseCase: sl()),
      )
      ..registerFactory(MenuAlgorithmCubit.new)
      ..registerFactory(
        () => MenuSettingsCubit(
          authManager: sl(),
          router: sl(),
        ),
      )
      ..registerFactory(
        () => MenuFreezeAccountCubit(
          getAccountStatusUseCase: sl(),
          unfreezeAccountUseCase: sl(),
          freezeAccountUseCase: sl(),
          verifyAccountStatusUseCase: sl(),
          menuRouter: sl(),
        ),
      )
      ..registerFactory(
        () => MenuDeleteAccountCubit(
          getReasonsForDeletionUseCase: sl(),
          verifyAccountStatusUseCase: sl(),
          deleteAccountUseCase: sl(),
          menuRouter: sl(),
        ),
      )
      ..registerFactory(
        () => MenuBlacklistCubit(
          getBlacklistUseCase: sl(),
          unblockUserUseCase: sl(),
        ),
      )
      ..registerFactory(() => MenuNotificationCubit(sl(), sl(), sl(), sl()))
      ..registerFactory(
        () => MenuFreeDatesCubit(getBonusesUseCase: sl(), router: sl()),
      )
      ..registerFactory(
        () => ReviewCubit(
          getFeedbackReasonsUseCase: sl(),
          sendFeedbackUseCase: sl(),
        ),
      )
      ..registerFactory(
        () => MenuStatisticsCubit(
          getDatingInfoUseCase: sl(),
          subscribeDatingInfoUseCase: sl(),
          authManager: sl(),
        ),
      );
  }
}
