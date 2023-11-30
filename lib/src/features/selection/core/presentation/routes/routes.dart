import 'package:auto_route/auto_route.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';

List<AutoRoute> selectionRoutes = [
  AutoRoute(
    page: SelectionRootRouter.page,
    path: SelectionRoutePath.selection,
    meta: const {'showBottomMenu': true},
    children: [
      AutoRoute(
        page: SelectionRoute.page,
        path: '',
        initial: true,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: SelectionSearchParamsRoute.page,
        path: SelectionRoutePath.searchParams,
      ),
      AutoRoute(
        page: MenuRootRouter.page,
        path: MenuRoutePath.algorithm,
        meta: const {'showBottomMenu': true},
        children: [
          AutoRoute(
            page: MenuAlgorithmRoute.page,
            path: '',
            initial: true,
          ),
        ],
      ),
      AutoRoute(
        page: SelectionCandidateRootRouter.page,
        path: SelectionRoutePath.candidate,
        children: [
          AutoRoute(
            page: SelectionCandidateRoute.page,
            path: '',
            initial: true,
            meta: const {'showBottomMenu': true},
          ),
          AutoRoute(
            page: SelectionCompatibilityRoute.page,
            path: SelectionRoutePath.compatibility,
            meta: const {'showBottomMenu': true},
          ),
        ],
      ),
    ],
  ),
];
