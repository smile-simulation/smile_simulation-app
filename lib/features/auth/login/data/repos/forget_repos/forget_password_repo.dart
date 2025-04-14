

import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failure.dart';
import '../../models/forget_model/forget_model.dart';



abstract class ForgetPasswordRepo {


  Future<Either<Failure, ForgetModel>> forgetPassword({
    required String email,

  });

  Future<Either<Failure, ForgetModel>> verifyOTP({
    required String email,
    required String codeOTP,
  });
  Future<Either<Failure, ForgetModel>> resetPassword({
    required String email,
    required String token,
    required String password,
    required String confirmPassword,
  });

}
