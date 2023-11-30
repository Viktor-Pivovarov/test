import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard(this.authManager);

  final AuthManager<AuthenticatedUser> authManager;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final bool isAuth = await authManager.isAuth;

    if (isAuth && authManager.user.profile.isRegistered) {
      resolver.next();

      // router.removeLast();

      return;
    }

    resolver.next(false);

    if (isAuth && authManager.user.profile.onRegister) {
      await router.replaceAll([
        AuthRoute(),
        SignUpStepsRoute(
          onResult: (bool success) {
            // resolver.next(success);

            // if (success) {
            //   router
            //     ..removeLast()
            //     ..removeLast();
            // }
          },
        ),
      ]);

      return;
    }

    await router.replace(
      AuthRoute(
        onResult: (bool success) {
          // if (success) {
          //   if (!resolver.isResolved) {
          //     resolver.next(authManager.user.profile.isRegistered);
          //   }

          //   if (authManager.user.profile.onRegister) {
          //     router.replaceAll([
          //       AuthRoute(),
          //       SignUpStepsRoute(),
          //     ]);
          //   } else {
          //     if (success) {
          //       resolver.next(success);

          //       router
          //         ..removeLast()
          //         ..removeLast();
          //     }
          //   }
          // }
        },
      ),
    );
  }
}
