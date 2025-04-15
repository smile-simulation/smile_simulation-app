import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../model/sign_up_model.dart';

abstract class SignUpRepo {
  // Future<Either<Failure, Map<String, dynamic>>> loginWithEmail({
  //   required String email,
  //   required String password,
  // });

  Future<Either<Failure, SignUpModel>> signUpFromUser({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullName,
    required int age,
    required String image,
    required String gender,
  });

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
  });
}
