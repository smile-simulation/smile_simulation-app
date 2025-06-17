
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../models/edit_profile/edit_profile_model.dart';

abstract class EditProfileRepo {
  Future<Either<Failure, EditProfileModel>> updateProfile({
    required String fullName,
    required String age,
    required String gender,
    required String experience,
    required String qualification,

    required String specialization,
    required String address,
    required DateTime birthDay,
  });
}
