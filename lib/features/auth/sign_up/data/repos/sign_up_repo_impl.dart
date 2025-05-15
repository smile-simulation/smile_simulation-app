import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_simulation/core/helper_functions/generate_random.dart';
import 'package:smile_simulation/features/auth/sign_up/data/repos/sign_up_repo.dart';
import '../../../../../constant.dart';
import '../../../../../core/api/api_keys.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_point.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../model/sign_up_model.dart';

class SignUpRepoImpl extends SignUpRepo {
  SignUpRepoImpl({required this.dioConsumer});

  final DioConsumer dioConsumer;

  @override
  Future<Either<Failure, SignUpModel>> signUpFromUser({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullName,
    required int age,
    required String image,
    required String gender,
  }) async {
    try {
      var response = await dioConsumer.post(
        EndPoint.signUpUser,
        data: {
          ApiKeys.fullName: fullName,
          ApiKeys.age: age,
          ApiKeys.email: email,
          ApiKeys.password: password,
          ApiKeys.confirmPassword: confirmPassword,
          ApiKeys.image: image,
          ApiKeys.gender: gender,
        },
        formData: true,
      );
      return Right(SignUpModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in SignUpFromUser: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in signUpFromUser: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في التسجيل'));
    }
  }

  @override
  Future<Either<Failure, SignUpModel>> signUpFromDoctor({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullName,
    required int experience,
    required File card,
    required String gender,
    required bool isCorrect,
    required String qualification,
    required String specialization,
  }) async {
    try {
      var response = await dioConsumer.post(
        EndPoint.signUpDoctor,
        data: {
          ApiKeys.fullName: fullName,
          ApiKeys.experience: experience,
          ApiKeys.email: email,
          ApiKeys.password: password,
          ApiKeys.confirmPassword: confirmPassword,
          ApiKeys.gender: gender,
          ApiKeys.isCorrect: isCorrect,
          ApiKeys.qualification: qualification,
          ApiKeys.specialization: specialization,
          ApiKeys.card: await MultipartFile.fromFile(
            card.path,
            filename: "${generateRandomString(sizeOfCode: 6)}card.jpg",
          ),
        },
        formData: true,
      );

      return Right(SignUpModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in SignUpFromDoctor: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in signUpFromDoctor: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في التسجيل'));
    }
  }
}
