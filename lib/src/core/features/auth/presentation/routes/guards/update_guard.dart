import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class UpdateGuard extends AutoRouteGuard {
  UpdateGuard(this._authManager);

  final AuthManager<AuthenticatedUser> _authManager;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (!_authManager.isChecked) {
      await router.replace(
        SplashRoute(
          onResult: (bool isSuccess) {
            if (isSuccess) {
              resolver.next();

              router.removeLast();
            }
          },
        ),
      );
    } else {
      resolver.next();

      router.removeLast();
    }
  }
}
