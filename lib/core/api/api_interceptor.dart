import 'package:dio/dio.dart';

import '../../constant.dart';
import '../database/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers['token'] = null;
    options.headers['lang'] = 'en';
    options.headers['Authorization'] =
        CacheHelper().getMap(key: userData) == null
            ? "Bearer "
            : 'Bearer ${CacheHelper().getMap(key: userData)!['token']}';
  }
}
