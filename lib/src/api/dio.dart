import 'package:dio/dio.dart';
import 'package:que_based_ecom_fe/src/constants.dart';
import 'package:que_based_ecom_fe/src/utils/get_token_from_secure_storage.dart';

class DioClient {
  final _actualDio = Dio();

  DioClient() {
    _actualDio.options.baseUrl = baseUrl;
    _actualDio.options.connectTimeout = const Duration(seconds: 3);
    _actualDio.options.receiveTimeout = const Duration(seconds: 3);
    _actualDio.options.headers['Content-Type'] = 'application/json';
    _addInterceptors();
  }

  void _addInterceptors() {
    _actualDio.interceptors.add(
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        // add authentication token to request header
        options.headers['Authorization'] =
            'Bearer $getTokenFromSecureStorage()';
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

  Dio get dio => _actualDio;
}
