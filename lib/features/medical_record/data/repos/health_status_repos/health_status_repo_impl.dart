
import 'package:dartz/dartz.dart';
import 'package:smile_simulation/features/medical_record/data/models/health_status_models/Health_status_model.dart';
import '../../../../../constant.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_point.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import 'health_status_repo.dart';

class HealthStatusRepoImpl extends HealthStatusRepo {
  HealthStatusRepoImpl({required this.dioConsumer});

  final DioConsumer dioConsumer;

  @override
  Future<Either<Failure, HealthStatusModel>> updateHealthStatus({
    required String userName,
    required bool isSmoker,
    required bool hasHypertension,
    required bool hasDiabetes,
    required bool hasHeartDisease,
    required bool hasLiverDisease,
    required bool hasKidneyDisease,
    required bool hasAnemia,
    required bool hasThyroidDisease,
    required bool hasHepatitis,
    required bool has_Surgical_Currency,
    required bool familyMedicalHistory,
    required String otherChronicDiseasesDescription,
    required String drug_Allergy,
    required String pregnancyAndBreastfeeding,
  }) async {
    try {
      final response = await dioConsumer.put(
        EndPoint.updateHealthStatus + userName,
        data: {
          "isSmoker": isSmoker ,
          "hasHypertension": hasHypertension ,
          "hasDiabetes":hasDiabetes ,
          "hasHeartDisease":hasHeartDisease ,
          "hasLiverDisease":hasLiverDisease ,
          "hasKidneyDisease":hasKidneyDisease ,
          "hasAnemia":hasAnemia ,
          "hasThyroidDisease":hasThyroidDisease ,
          "hasHepatitis":hasHepatitis ,
          "otherChronicDiseasesDescription":otherChronicDiseasesDescription ,
          "drug_Allergy":drug_Allergy ,
          "has_Surgical_Currency": has_Surgical_Currency,
          "familyMedicalHistory": familyMedicalHistory,
          "pregnancyAndBreastfeeding":pregnancyAndBreastfeeding
        },
      );

      return Right(HealthStatusModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in  HealthStatusRepo : ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in HealthStatusRepo: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع أثناء تحديث البيانات'));
    }
  }
  @override
  Future<Either<Failure, HealthStatusModel>> fetchHealthStatus({required String userName}) async {
    try {
      final response = await dioConsumer.get(
        'http://smilesimulation.runasp.net/api/User/GetPatientHealthConditionData/$userName',
      );
      return Right(HealthStatusModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in fetchHealthStatus: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in fetchHealthStatus: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع أثناء جلب البيانات'));
    }
  }
}
