import 'package:auto_route/auto_route.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/languages/_languages.dart';

List<AutoRoute> languagesRoutes = [
  AutoRoute(
    page: LanguagesRoute.page,
    path: LanguagesRoutePath.languages,
  ),
];
