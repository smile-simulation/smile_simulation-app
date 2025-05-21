import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/errors/failure.dart';

abstract class SetUserAccountImageRepo {
  Future<Either<Failure, Uint8List>> setUserAccountImage({required File image});
}
