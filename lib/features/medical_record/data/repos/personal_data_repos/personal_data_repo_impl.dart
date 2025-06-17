// personal_data_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_simulation/features/medical_record/data/repos/personal_data_repos/personal_data_repo.dart';
import '../../../../../constant.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_point.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../models/personal_data_models/persona_data_model.dart';

class PersonalDataRepoImpl extends PersonalDataRepo {
  PersonalDataRepoImpl({required this.dioConsumer});

  final DioConsumer dioConsumer;

  @override
  Future<PersonaDataModel> getPatientPersonalData(String userName) async {
    try {
      final response = await dioConsumer.get(
        'http://smilesimulation.runasp.net/api/User/GetPatientPersonalData?UserName=$userName',
      );
      return PersonaDataModel.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    } catch (e) {
      throw Exception('Failed to fetch patient data: $e');
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
        '${EndPoint.updatePersonalData}$userName', // تأكد من تعريف EndPoint.updatePersonalData
        data: {
          "fullName": fullName,
          "email": email,
          "age": age,
          "phoneNumber": phoneNumber,
          "gender": gender,
          "job": job,
          "maritalStatus": maritalStatus,
        },
      ) as Map<String, dynamic>;
      return Right(PersonaDataModel.fromJson(
        response,
      ));
    } on ServerException catch (e) {
      logger.e("Exception in updatePersonalData: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message ?? 'Unknown error'));
    } catch (e) {
      logger.e("Exception in updatePersonalData: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع أثناء تحديث البيانات'));
    }
  }
}