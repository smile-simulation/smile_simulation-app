import 'dart:developer';
import 'dart:math' as maths;

import 'package:dartz/dartz.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/api_keys.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/api/end_point.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/advices/data/dummy_data/json_advices.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo/advices_repo.dart';

import '../../dummy_data/json_advices_categories.dart';

class AdvicesRepoImpl implements AdvicesRepo {
  final DioConsumer dioConsumer;
  AdvicesRepoImpl({required this.dioConsumer});
  List getRandomAdvices(List advices) {
    advices.shuffle(maths.Random());
    return advices.length > 10 ? advices.sublist(0, 10) : advices;
  }

  @override
  Future<Either<Failure, List<Advice>>> getGeneralAdvices() async {
    try {
      var response = await dioConsumer.get(EndPoint.allAdvices);
      List<Advice> advices = [];
      // List<dynamic> advicesJsonList = response[ApiKeys.data];
      List<dynamic> advicesJsonList = jsonAdvices;

      for (Map<String, dynamic> advice in advicesJsonList) {
        // log("Json Data: ${advice.toString()}");
        log("the Model: ${Advice.fromJson(advice).toString()}");
        advices.add(Advice.fromJson(advice));
      }
      advices = getRandomAdvices(advices) as List<Advice>;
      return Right(advices);
    } on ServerException catch (e) {
      logger.e("Exception in Get Advices: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Get Advices: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }

  @override
  Future<Either<Failure, List<AdvicesCategory>>>
  getAllAdvicesCategories() async {
    try {
      var response = await dioConsumer.get(EndPoint.allAdvicesCategories);
      List<AdvicesCategory> advicesCategories = [];
      // List<dynamic> advicesCategoriesJsonList = response[ApiKeys.data];
      List<dynamic> advicesCategoriesJsonList = jsonAdvicesCategories;

      for (Map<String, dynamic> advicesCategory in advicesCategoriesJsonList) {
        // log("Json Data: ${advicesCategory.toString()}");
        log(
          "the Model: ${AdvicesCategory.fromJson(advicesCategory).toString()}",
        );
        advicesCategories.add(AdvicesCategory.fromJson(advicesCategory));
      }
      // advicesCategories = getRandomAdvices(advicesCategories) as List<Advice>;
      return Right(advicesCategories);
    } on ServerException catch (e) {
      logger.e("Exception in Get Advices: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Get Advices: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }
}
