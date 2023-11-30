import 'package:auto_route/auto_route.dart';
import 'package:jojo_supporting/jojo_supporting.dart';

@AutoRouterConfig.module()
class SupportingPackageModule extends $SupportingPackageModule {}

List<AutoRoute> supportingRoutes = [
  AutoRoute(
    page: SupportingRoute.page,
    path: SupportingRoutePath.supporting,
  ),
];
