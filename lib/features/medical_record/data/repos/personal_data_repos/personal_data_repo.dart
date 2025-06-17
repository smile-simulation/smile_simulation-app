// personal_data_repo.dart
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../models/personal_data_models/persona_data_model.dart';

abstract class PersonalDataRepo {
  Future<PersonaDataModel> getPatientPersonalData(String userName);
  Future<Either<Failure, PersonaDataModel>> updatePersonalData({
    required String userName,
    required String fullName,
    required String email,
    required int age,
    required String phoneNumber,
    required String gender,
    required String job,
    required String maritalStatus,
  });
}