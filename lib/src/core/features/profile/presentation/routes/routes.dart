import 'package:auto_route/auto_route.dart';
import 'package:jojo/src/core/_core.dart';

List<AutoRoute> profileRoutes = [
  AutoRoute(
    page: ProfileRootRouter.page,
    path: ProfileRoutePath.profile,
    initial: true,
    meta: const {'showBottomMenu': true},
    children: [
      AutoRoute(
        page: ProfileRoute.page,
        path: '',
        initial: true,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: ProfileEditBirthTimeRoute.page,
        path: ProfileRoutePath.editBirthTime,
      ),
      AutoRoute(
        page: ProfilePhotosRoute.page,
        path: ProfileRoutePath.photos,
        meta: const {'showBottomMenu': true},
      ),
      AutoRoute(
        page: ProfileAboutMeRoute.page,
        path: ProfileRoutePath.aboutMe,
      ),
      AutoRoute(
        page: ProfileQuestionnaireRoute.page,
        path: ProfileRoutePath.questionnaire,
      ),
      AutoRoute(
        page: ProfileInterestsRoute.page,
        path: ProfileRoutePath.interests,
      ),
    ],
  ),
];
