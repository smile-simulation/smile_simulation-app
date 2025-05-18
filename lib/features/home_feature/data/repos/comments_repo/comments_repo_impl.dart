import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/api_keys.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/core/errors/failure.dart';

import '../../models/comment_model.dart';
import 'comments_repo.dart';

class CommentsRepoImpl implements CommentsRepo {
  final DioConsumer dioConsumer;

  CommentsRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, List<CommentModel>>> getAllCommentsByPostId({
    required int postId,
  }) async {
    try {
      var response = await dioConsumer.get("Comment/postId/$postId");
      List<CommentModel> comments = [];
      List<dynamic> commentsJsonList = response[ApiKeys.data];
      for (Map<String, dynamic> comment in commentsJsonList) {
        comments.add(CommentModel.fromJson(comment));
      }
      log(comments.length.toString());
      return Right(comments);
    } on ServerException catch (e) {
      logger.e("Exception in Get Posts: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Get Posts: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }
 
  @override
  Future<Either<Failure, String>> addPost({
    required int postId,
    required String commentContent,
  }) async {
    try {
      var response = await dioConsumer.post(
        "Comment/postId/$postId",
        data: {"content": "$commentContent"},
      );
      String message = response[ApiKeys.message];
      log(message);
      // String message = "hi";
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
