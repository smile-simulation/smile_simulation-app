import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'dart:io';

abstract class SetUserAccountImageRepo {
  Future<Either<Failure, String>> setUserAccountImage({
    required File image,
  });
}