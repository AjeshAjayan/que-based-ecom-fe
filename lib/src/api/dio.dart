import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:que_based_ecom_fe/src/constants.dart';

class DioClient {
  final _actualDio = Dio();

  DioClient() {
    _actualDio.options.baseUrl = baseUrl;
    _actualDio.options.connectTimeout = const Duration(seconds: 3);
    _actualDio.options.receiveTimeout = const Duration(seconds: 3);
    _addInterceptors();
  }

  void _addInterceptors() {
    _actualDio.interceptors.add(
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        // add authentication token to request header
        options.headers['Authorization'] =
            'Bearer $_getTokenFromSecureStorage()';
        return handler.next(options);
      }, onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      }, onError: (DioException exception, ErrorInterceptorHandler handler) {
        return handler.next(exception);
      }),
    );
    _actualDio.interceptors.add(LogInterceptor(responseBody: true));
    _actualDio.interceptors.add(LogInterceptor(requestBody: true));
  }

  Future<String?> _getTokenFromSecureStorage() async {
    const storage = FlutterSecureStorage();
    return storage.read(key: 'token');
  }

  Dio get dio => _actualDio;
}
