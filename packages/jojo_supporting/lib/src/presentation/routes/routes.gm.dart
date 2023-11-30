// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:jojo_supporting/src/presentation/pages/supporting_page.dart'
    as _i1;

abstract class $SupportingPackageModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SupportingRoute.name: (routeData) {
      return _i2.AutoRoutePage<bool>(
        routeData: routeData,
        child: const _i1.SupportingPage(),
      );
    }
  };
}

/// generated route for
/// [_i1.SupportingPage]
class SupportingRoute extends _i2.PageRouteInfo<void> {
  const SupportingRoute({List<_i2.PageRouteInfo>? children})
      : super(
          SupportingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportingRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
