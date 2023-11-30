import 'dart:io';

import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor(SecureStorageService storage) : _storage = storage;

  final SecureStorageService _storage;

  CancelToken? cancelToken;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final hasToken = await _storage.hasToken;

    if (hasToken) {
      try {
        final token = await _storage.getToken() ?? '';
        final socketId = await _storage.getSocketId() ?? '';

        options.headers.addAll(<String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'X-Socket-ID': socketId,
        });
      } catch (_) {
        return handler.next(options);
      }
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _cancelRequest();
    }

    return super.onError(err, handler);
  }

  void _cancelRequest() {
    cancelToken?.cancel();

    AuthInjection.sl<AuthManager<AuthenticatedUser>>().signOut(remote: false);
  }
}
