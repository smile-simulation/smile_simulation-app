import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers['token'] = null;
    options.headers['lang'] = 'en';
    options.headers['Authorization'] =
        '';
  }
}
