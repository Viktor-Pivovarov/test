import 'package:auto_route/auto_route.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';

List<AutoRoute> geoLocationRoutes = [
  AutoRoute(
    page: GeoLocationRoute.page,
    path: GeoLocationRoutePath.geoLocation,
  ),
];
