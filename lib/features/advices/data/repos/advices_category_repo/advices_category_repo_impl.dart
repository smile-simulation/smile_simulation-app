import 'dart:developer';
import 'dart:math' as maths;

import 'package:dartz/dartz.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/api_keys.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/api/end_point.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/errors/failure.dart';

import '../../models/advice/advice.dart';
import 'advices_category_repo.dart';

class AdvicesCategoryRepoImpl implements AdvicesCategoryRepo {
  final DioConsumer dioConsumer;

  AdvicesCategoryRepoImpl({required this.dioConsumer});
  List reArrangeAdvices(List advices) {
    advices.shuffle(maths.Random());
    return advices;
  }

  @override
  Future<Either<Failure, List<Advice>>> getAdvicesByCategoryId({
    required int id,
  }) async {
    try {
      var response = await dioConsumer.get(
        "${EndPoint.adviceByCategoryId}/$id",
      );
      List<Advice> advices = [];
      List<dynamic> advicesJsonList = response[ApiKeys.data];
      // List<dynamic> advicesJsonList = jsonAdvices;

      for (Map<String, dynamic> advice in advicesJsonList) {
        log(" ------------ Divider ------------------");
        log("Json Data: ${advice.toString()}");
        log("the Model: ${Advice.fromJson(advice).toString()}");
        log(" ------------ Divider ------------------");
        advices.add(Advice.fromJson(advice));
      }
      advices = reArrangeAdvices(advices) as List<Advice>;
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
