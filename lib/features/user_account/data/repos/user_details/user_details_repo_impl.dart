import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_simulation/constant.dart' show logger;
import 'package:smile_simulation/core/api/api_keys.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/api/end_point.dart';
import 'package:smile_simulation/core/errors/exceptions.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/features/user_account/data/models/user/user..dart';
import 'package:smile_simulation/features/user_account/data/repos/user_details/user_details_repo.dart';

import '../../../../../core/errors/failure.dart';

class UserDetailsRepoImpl implements UserDetailsRepo {
  final DioConsumer dioConsumer;

  UserDetailsRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, User>> getUserDetails({required String token}) async {
    // dioConsumer.get(path);
    Response response = await Dio().get(
      "http://smilesimulation.runasp.net/api/User/GetUserDetils",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    print(response.data);

    // TODO: implement getUserDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PostModel>>> getPosts({
    required String userId,
  }) async {
    try {
      var response = await dioConsumer.get(
        "${EndPoint.getPostsByPublisherId}/$userId",
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
  Future<Either<Failure, String>> removePost({required int postId}) async {
    try {
      var response = await dioConsumer.delete("${EndPoint.post}/$postId");
      return Right(response[ApiKeys.message]);
    } on ServerException catch (e) {
      logger.e("Exception in Get Posts: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Get Posts: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في استعادة البيانات'));
    }
  }
}
