import 'package:dartz/dartz.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/api_keys.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/api/end_point.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/advices/data/dummy_data/json_advices.dart';

import '../../models/advice/advice.dart';
import 'advices_category_repo.dart';

class AdvicesCategoryRepoImpl implements AdvicesCategoryRepo {
  final DioConsumer dioConsumer;

  AdvicesCategoryRepoImpl({required this.dioConsumer});

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
      // List<dynamic> advicesJsonList = getDataFromJson(jsonAdvices, id);

      for (Map<String, dynamic> advice in advicesJsonList) {
        advices.add(Advice.fromJson(advice));
      }
      // advices = reArrangeAdvices(advices) as List<Advice>;
      return Right(advices);
    } on ServerException catch (e) {
      logger.e("Exception in Get Advices: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Get Advices: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }

  getDataFromJson(List<Map<String, dynamic>> jsonList, int id) {
    List<Map<String, dynamic>> advices = [];
    for (Map<String, dynamic> advice in jsonList) {
      if (advice['categoryId'] == id) {
        advices.add(advice);
      }
    }
    return advices;
  }
}
