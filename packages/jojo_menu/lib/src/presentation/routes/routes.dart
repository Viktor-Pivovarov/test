import 'package:auto_route/auto_route.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_supporting/jojo_supporting.dart';

@AutoRouterConfig.module()
class MenuPackageModule extends $MenuPackageModule {}

List<AutoRoute> menuRoutes = [
  AutoRoute(
    page: MenuRootRouter.page,
    path: MenuRoutePath.menu,
    meta: const {'showBottomMenu': true},
    children: [
      AutoRoute(
        page: MenuRoute.page,
        path: '',
        initial: true,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuDeleteAccountRoute.page,
        path: MenuRoutePath.deleteAccount,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuDeleteAccountConfirmRoute.page,
        path: MenuRoutePath.deleteAccountConfirm,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuAboutRoute.page,
        path: MenuRoutePath.about,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuAlgorithmRoute.page,
        path: MenuRoutePath.algorithm,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuBlacklistRoute.page,
        path: MenuRoutePath.blacklist,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuFreeDatesRoute.page,
        path: MenuRoutePath.freeDates,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuFreezeAccountRoute.page,
        path: MenuRoutePath.freezeAccount,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuLanguagesRoute.page,
        path: MenuRoutePath.languages,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuNotificationsRoute.page,
        path: MenuRoutePath.notifications,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuSettingsRoute.page,
        path: MenuRoutePath.settings,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuStatisticsRoute.page,
        path: MenuRoutePath.statistics,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuSupportRoute.page,
        path: MenuRoutePath.support,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuTariffsRoute.page,
        path: MenuRoutePath.tariffs,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuPersonalDataRoute.page,
        path: MenuRoutePath.personalDataProcessing,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuPrivacyPolicyRoute.page,
        path: MenuRoutePath.privacyPolicy,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: MenuTermsOfUseRoute.page,
        path: MenuRoutePath.terms,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: SupportingRoute.page,
        path: MenuRoutePath.supportForm,
      ),
    ],
  ),
];
