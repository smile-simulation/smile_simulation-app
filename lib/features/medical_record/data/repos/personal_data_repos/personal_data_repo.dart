import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../models/personal_data_models/Persona_data_model.dart';


abstract class PersonalDataRepo {


  Future<Either<Failure, PersonaDataModel>> getPersonalData({
    required String userName,

  });
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
