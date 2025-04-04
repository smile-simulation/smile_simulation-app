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
}
