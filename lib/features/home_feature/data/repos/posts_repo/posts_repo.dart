import 'package:dartz/dartz.dart';

abstract class PostsRepo {
  Future<Either<void, void>> getPostsRepo();
}
