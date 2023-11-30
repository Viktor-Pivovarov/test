import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class LogoutInterceptor extends Interceptor {
  LogoutInterceptor();

  CancelToken? cancelToken;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      cancelToken?.cancel();
      AuthInjection.sl<AuthManager<AuthenticatedUser>>().signOut(remote: false);

      // CoreSL.sl<RootStackRouter>().replaceNamed('/');
    }

    return super.onError(err, handler);
  }
}
