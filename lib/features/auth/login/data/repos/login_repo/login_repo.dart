import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smile_simulation/features/auth/login/data/models/login_model/Login_model.dart';

import '../../../../../../core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  });
}
