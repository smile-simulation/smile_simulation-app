import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<PostModel>>> getPostsRepo();
}
