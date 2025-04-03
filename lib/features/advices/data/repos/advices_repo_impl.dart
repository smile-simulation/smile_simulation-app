import 'dart:math' as maths;

import 'package:dartz/dartz.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/api_keys.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/api/end_point.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/advices/data/json_advices.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo.dart';

class AdvicesRepoImpl implements AdvicesRepo {
  final DioConsumer dioConsumer;
  AdvicesRepoImpl({required this.dioConsumer});
  List<Advice> getRandomAdvices(List<Advice> advices) {
    advices.shuffle(maths.Random());
    return advices.length > 10 ? advices.sublist(0, 10) : advices;
  }

  @override
  Future<Either<Failure, List<Advice>>> getGeneralAdvices() async {
    try {
      var response = await dioConsumer.get(EndPoint.getAllAdvices);
      List<Advice> advices = [];
      // List<dynamic> advicesJsonList = response[ApiKeys.data];
      List<dynamic> advicesJsonList = jSonAdvices;

      for (Map<String, dynamic> advice in advicesJsonList) {
        advices.add(Advice.fromJson(advice));
      }
      advices = getRandomAdvices(advices);
      return Right(advices);
    } on ServerException catch (e) {
      logger.e("Exception in Get Advices: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Get Advices: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }
}
