import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<PostModel>>> getPosts({
    required int pageNumber,
    required int pageSize,
  });

  Future<Either<Failure, PostModel>> getPostById({required int postId});

  Future<Either<Failure, String>> makeLike({required int postId});
}
