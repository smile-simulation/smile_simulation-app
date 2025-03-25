import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = 'https://umszdjphnixokwvykjti.supabase.co/rest/v1/';
  Dio dio = Dio();
  final apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVtc3pkanBobml4b2t3dnlranRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk4MzA5NTAsImV4cCI6MjAyNTQwNjk1MH0.j62fneF-iziMqsvUl8BIfUCDMrxnA1QpARM6c2EQ_x8';

  Future<Response> getData(
    String endpoint,
    String filter, [
    int start = 0,
    int? end,
  ]) async {
    return await dio.get(
      _baseUrl + endpoint + filter,
      options: Options(headers: {'apikey': apiKey}),
    );
  }

  Future<Response> postData({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      _baseUrl + endpoint,
      data: data,
      options: Options(headers: {'apikey': apiKey}),
    );
  }

  Future<Response> patchData({
    required String id,
    required String endpoint,
    Map<String, dynamic>? data,
    bool isFromData = false,
  }) async {
    endpoint = "$_baseUrl$endpoint?id=eq.$id";

    return await dio.patch(
      endpoint,
      data: data,
      options: Options(headers: {'apikey': apiKey}),
    );
  }
}
