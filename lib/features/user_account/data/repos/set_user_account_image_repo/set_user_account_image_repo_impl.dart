import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/api_keys.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';

import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/core/helper_functions/generate_random.dart';

import 'set_user_account_image_repo.dart';

class SetUserAccountImageRepoImpl implements SetUserAccountImageRepo {
  final DioConsumer dioConsumer;

  SetUserAccountImageRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, Uint8List>> setUserAccountImage({
    required File image,
  }) async {
    try {
      var response = await dioConsumer.put(
        formData: true,
        "User/EditUserImage",
        data: {
          "Image": await MultipartFile.fromFile(
            image.path,
            filename:
                "${generateRandomString(sizeOfCode: 6)}userAccountImage.jpg",
          ),
        },
      );
      Uint8List bytesImage = await image.readAsBytes();
      String message = response[ApiKeys.message];
      log(message);
      return Right(bytesImage);
    } on ServerException catch (e) {
      logger.e("Exception in Add post: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Add post: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }
}
