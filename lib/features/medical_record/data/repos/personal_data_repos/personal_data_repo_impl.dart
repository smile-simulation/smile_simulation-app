import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:smile_simulation/features/medical_record/data/repos/personal_data_repos/personal_data_repo.dart';
import '../../../../../constant.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_point.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../models/personal_data_models/Persona_data_model.dart';

class PersonalDataRepoImpl extends PersonalDataRepo {
  PersonalDataRepoImpl({required this.dioConsumer});

  final DioConsumer dioConsumer;

  @override
  Future<Either<Failure, PersonaDataModel>> getPersonalData({
    required String userName,
  }) async {
    try {
      var response = await dioConsumer.get(EndPoint.getPersonalData + userName);
      log(response.toString());
      CacheHelper().saveMap(key: personalData, value: response["data"]);
      return Right(PersonaDataModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in PersonalData: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in PersonalData: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في التسجيل'));
    }
  }

  @override
  Future<Either<Failure, PersonaDataModel>> updatePersonalData({
    required String userName,
    required String fullName,
    required String email,
    required int age,
    required String phoneNumber,
    required String gender,
    required String job,
    required String maritalStatus,
  }) async {
    try {
      final response = await dioConsumer.put(
        EndPoint.updatePersonalData + userName,
        data: {
          "fullName": fullName,
          "email": email,
          "age": age,
          "phoneNumber": phoneNumber,
          "gender": gender,
          "job": job,
          "maritalStatus": maritalStatus,
        },
      );

      return Right(PersonaDataModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in updatePersonalData: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in updatePersonalData: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع أثناء تحديث البيانات'));
    }
  }
}
