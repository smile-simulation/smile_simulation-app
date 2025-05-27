import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/api_keys.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/core/helper_functions/generate_random.dart';
import 'set_user_account_image_repo.dart';

class SetUserAccountImageRepoImpl implements SetUserAccountImageRepo {
  final DioConsumer dioConsumer;

  SetUserAccountImageRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, String>> setUserAccountImage({
    required File image,
  }) async {
    try {
      var response = await dioConsumer.put(
        formData: true,
        "User/EditUserImage",
        data: {
          "Image": await MultipartFile.fromFile(
            image.path,
            filename: "${generateRandomString(sizeOfCode: 6)}userAccountImage.jpg",
          ),
        },
      );
      String imageLink = response[ApiKeys.data];
      await cacheNewImage(imageLinke: imageLink);
      log("Image updated: $imageLink");
      return Right(imageLink);
    } on ServerException catch (e) {
      logger.e("Exception in Add post: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Add post: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }

  Future<void> cacheNewImage({required String imageLinke}) async {
    Map<String, dynamic> oldUserMap = await CacheHelper().getMap(key: userData)!;
    oldUserMap['image'] = imageLinke;
    await CacheHelper().saveMap(key: userData, value: oldUserMap);
  }
}