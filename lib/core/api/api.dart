import 'package:dio/dio.dart';

import 'end_point.dart';

class ApiService {
  final Dio _dio;

  final baseUrl = EndPoint.baseUrl;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
