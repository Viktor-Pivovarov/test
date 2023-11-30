import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class AppRouter {
  AppRouter(this._router);

  final RootStackRouter _router;

  BuildContext get context => _router.navigatorKey.currentState!.context;

  RootStackRouter get root => _router.root;

  Future<T?> push<T extends Object?>(PageRouteInfo route) async {
    return _router.push(route);
  }

  Future<T?> pushNamed<T extends Object?>(
    String path, {
    bool includePrefixMatches = false,
  }) {
    return _router.pushNamed(path, includePrefixMatches: includePrefixMatches);
  }

  Future<T?> replaceNamed<T extends Object?>(
    String path, {
    bool includePrefixMatches = false,
  }) {
    return _router.replaceNamed(
      path,
      includePrefixMatches: includePrefixMatches,
    );
  }

  Future<T?> replace<T extends Object?>(
    PageRouteInfo route, {
    OnNavigationFailure? onFailure,
  }) {
    return _router.replace(route);
  }

  Future<bool> pop<T extends Object?>([T? result]) async {
    return _router.pop(result);
  }

  void popUntilRoot() {
    _router.popUntilRoot();
  }

  Future<dynamic> navigate(PageRouteInfo route) async {
    return _router.navigate(route);
  }

  Future<void> navigateNamed(
    String path, {
    bool includePrefixMatches = false,
  }) {
    return _router.navigateNamed(
      path,
      includePrefixMatches: includePrefixMatches,
    );
  }
}
