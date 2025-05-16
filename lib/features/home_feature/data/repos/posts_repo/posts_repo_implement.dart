import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/api_keys.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/api/end_point.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/core/helper_functions/generate_random.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

import 'posts_repo.dart';

class PostsRepoImplement implements PostsRepo {
  final DioConsumer dioConsumer;

  PostsRepoImplement({required this.dioConsumer});

  @override
  Future<Either<Failure, List<PostModel>>> getPosts({
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      var response = await dioConsumer.get(
        "${EndPoint.post}?pageNumber=$pageNumber&pageSize=$pageSize",
      );
      List<PostModel> posts = [];
      List<dynamic> postsJsonList = response[ApiKeys.data];
      for (Map<String, dynamic> post in postsJsonList) {
        posts.add(PostModel.fromJson(post));
      }
      return Right(posts);
    } on ServerException catch (e) {
      logger.e("Exception in Get Posts: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Get Posts: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }

  @override
  Future<Either<Failure, String>> makeLike({required int postId}) async {
    try {
      var response = await dioConsumer.post("Like/postid/${postId}");
      // log(("تم اضافة الاعجاب للمنشور" == response[ApiKeys.message]).toString());
      return Right((response[ApiKeys.message]));
    } on ServerException catch (e) {
      logger.e("Exception in Get posts: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      log(e.toString());
      logger.e("Exception in Get posts: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }

  @override
  Future<Either<Failure, PostModel>> getPostById({required int postId}) async {
    try {
      var response = await dioConsumer.get("Post/$postId");
      dynamic postJson = response[ApiKeys.data];
      log(postJson.toString());
      PostModel post = PostModel.fromJson(postJson);
      return Right(post);
    } on ServerException catch (e) {
      logger.e("Exception in Get Advices: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Get Advices: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }

  @override
  Future<Either<Failure, String>> addPost({
    required String content,
    required File? image,
  }) async {
    try {
      var response = await dioConsumer.post(
        formData: true,
        "Post",
        data: {
          "Content": content,
          "Image":
              image != null
                  ? await MultipartFile.fromFile(
                    image.path,
                    filename:
                        "${generateRandomString(sizeOfCode: 6)}postImage.jpg",
                  )
                  : null,
        },
      );
      String message = response[ApiKeys.message];
      log(message);
      return Right(message);
    } on ServerException catch (e) {
      logger.e("Exception in Add post: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Add post: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }
}
