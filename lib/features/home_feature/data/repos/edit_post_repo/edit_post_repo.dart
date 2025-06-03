import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/errors/failure.dart';

abstract class EditPostRepo {
  Future<Either<Failure, String>> editPost({
    required int postId,
    String? postContent,
    File? postImage,
  });
}
