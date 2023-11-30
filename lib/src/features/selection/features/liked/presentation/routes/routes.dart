import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

List<AutoRoute> likedRoutes = [
  AutoRoute(
    page: LikedRootRouter.page,
    path: LikedRoutePath.liked,
    children: [
      AutoRoute(
        page: LikedRoute.page,
        path: '',
        initial: true,
        meta: const {'showBottomMenu': true},
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
