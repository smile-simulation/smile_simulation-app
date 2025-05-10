import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/api_keys.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/api/end_point.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

import 'posts_repo.dart';

class PostsRepoImplement implements PostsRepo {
  final DioConsumer dioConsumer;

  PostsRepoImplement({required this.dioConsumer});
  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      var response = await dioConsumer.get(
        "${EndPoint.post}?pageNumber=1&pageSize=5",
      );
      List<PostModel> posts = [];
      List<dynamic> postsJsonList = response[ApiKeys.data];
      // List<dynamic> postsJsonList = jsonPosts;
      log(postsJsonList.toString());
      for (Map<String, dynamic> post in postsJsonList) {
        // log("Json Data: ${post.toString()}");

        // log("the Model: ${PostModel.fromJson(post).toString()}");
        posts.add(PostModel.fromJson(post));
      }
      // log(posts.toString());
      return Right(posts);
    } on ServerException catch (e) {
      logger.e("Exception in Get Advices: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Get Advices: $e");
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
}
