import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/api/end_point.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/core/helper_functions/generate_random.dart';
import 'package:smile_simulation/features/home_feature/data/repos/edit_post_repo/edit_post_repo.dart';

class EditPostRepoImpl implements EditPostRepo {
  final DioConsumer dioConsumer;

  EditPostRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, String>> editPost({
    required int postId,
    String? postContent,
    File? postImage,
  }) async {
    try {
      var response = await dioConsumer.put(
        formData: true,
        "${EndPoint.post}/$postId",
        data: {
          "Content": postContent,
          "Image":
              postImage != null
                  ? await MultipartFile.fromFile(
                    postImage.path,
                    filename:
                        "${generateRandomString(sizeOfCode: 6)}postImage.jpg",
                  )
                  : null,
        },
      );

      return Right(response["message"]);
    } on ServerException catch (e) {
      logger.e("Exception in Get Posts: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Get Posts: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }
}
