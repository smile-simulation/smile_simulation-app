import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import '../../models/comment_model.dart';

abstract class CommentsRepo {
  Future<Either<Failure, List<CommentModel>>> getAllCommentsByPostId({
    required int postId,
  });
}
