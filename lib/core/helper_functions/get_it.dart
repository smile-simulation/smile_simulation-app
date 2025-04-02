import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
}
