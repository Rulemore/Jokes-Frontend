import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:zlp_jokes/utils/services/auth_service.dart';

class HttpAPI {
  static late final String _baseURLHost;
  static final AuthService _authService = AuthService();

  static Dio newDio({
    int receiveTimeout = 5000,
    int connectTimeout = 5000,
    bool allowBadCertificate = false,
  }) {
    final options = BaseOptions(baseUrl: _baseURLHost);
    options.receiveTimeout = Duration(milliseconds: receiveTimeout);
    options.connectTimeout = Duration(milliseconds: connectTimeout);
    options.sendTimeout = Duration(milliseconds: receiveTimeout);
    final dio = Dio(options);
    if (allowBadCertificate == true) {
      (dio.httpClientAdapter as IOHttpClientAdapter).validateCertificate =
          (X509Certificate? cert, String host, int port) {
        return true;
      };
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          final token = _authService.getToken();
          options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
      ),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}
