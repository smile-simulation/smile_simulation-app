import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smile_simulation/features/medical_record/data/models/health_status_models/Health_status_model.dart';
import '../../../../../constant.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_point.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../models/edit_profile/edit_profile_model.dart';
import 'edit_profile_repo.dart';

class EditProfileRepoImpl extends EditProfileRepo {
  EditProfileRepoImpl({required this.dioConsumer});

  final DioConsumer dioConsumer;

  @override
  Future<Either<Failure, EditProfileModel>> updateProfile({
    required String fullName,
    required String age,
    required String gender,
    required String experience,
    required String qualification,

    required String specialization,
    required String address,
    required DateTime birthDay,
  }) async {
    log("day: ${birthDay}");
    try {
      final response = await dioConsumer.put(
        EndPoint.editProfile,
        data: {
          "FullName": fullName,
          "Age ": age,
          "Gender": gender,
          "Experience": experience,
          "Qualification": qualification,
          "Specialization": specialization,
          "Address": address,
          "BirthDay": "${birthDay.year}-${birthDay.month}-${birthDay.day}",
        },
        formData: true,
      );

      return Right(EditProfileModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in  EditProfileRepo  : ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in EditProfileRepo: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع أثناء تحديث البيانات'));
    }
  }
}
