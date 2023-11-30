import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

@Deprecated('Use DioApiClient')
class ApiDioClient {
  @Deprecated('Use DioApiClient')
  ApiDioClient(Uri uri) {
    _initBaseOptions(uri);

    _initInterceptors();
  }

  final Dio _dio = Dio();

  CancelToken cancelToken = CancelToken();

  Dio get dio => _dio;

  Map<String, String> get headers {
    return Map.castFrom<String, dynamic, String, String>(_dio.options.headers);
  }

  void _initBaseOptions(Uri baseUrl) {
    _dio.options.baseUrl = baseUrl.toString();
    _dio.options.connectTimeout = const Duration(seconds: 50);
    _dio.options.receiveTimeout = const Duration(seconds: 50);

    _dio.options.headers.addAll({HttpHeaders.acceptHeader: ContentType.json});

    _dio.options.responseType = ResponseType.json;
  }

  void _initInterceptors() {
    _dio.interceptors.add(DeviceHeaderInterceptor());

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(requestBody: true));
    }

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (cancelToken.isCancelled) {
      cancelToken = CancelToken();
      // logoutInterceptor.cancelToken = cancelToken;
    }

    options.cancelToken = cancelToken;

    return handler.next(options);
  }

  Future<void> _onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    // ignore: avoid_dynamic_calls
    if (response.data.runtimeType != String) {
      // ignore: avoid_dynamic_calls
      if (response.data != null && response.data['data'] != null) {
        // ignore: avoid_dynamic_calls
        response.data = response.data['data'];
      }
    }

    return handler.next(response);
  }

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  Future<void> _onError(DioException e, ErrorInterceptorHandler handler) async {
    late DioException error;

    if (e.response == null && e.error is SocketException) {
      error = DioNetworkError(
        requestOptions: e.requestOptions,
        type: e.type,
        error: e.error,
        response: e.response,
      );
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      error = DioConnectTimeoutError(
        requestOptions: e.requestOptions,
        type: e.type,
        error: e.error,
        response: e.response,
      );
    } else if (e.type == DioExceptionType.unknown) {
      error = DioConnectTimeoutError(
        requestOptions: e.requestOptions,
        type: e.type,
        error: e.error,
        response: e.response,
      );
    } else if (e.type == DioExceptionType.cancel) {
      error = DioCancelError(
        requestOptions: e.requestOptions,
        type: e.type,
        error: e.error,
        response: e.response,
      );
    } else {
      error = e;
    }

    return handler.next(error);
  }

  set newBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  String get newBaseUrl {
    return _dio.options.baseUrl;
  }
}
